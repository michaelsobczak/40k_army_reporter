
var MultiselectField = function(config) {
    jsGrid.Field.call(this, config);
};

MultiselectField.prototype = new jsGrid.Field({
    
    items: [],
    textField: "",
    
    itemTemplate: function(value) {
        return $.makeArray(value).join(", ");
    },
    
    _createSelect: function(selected) {
        var textField = this.textField;
        var $result = $("<select>").attr("multiple", "multiple");
        
        $.each(this.items, function(_, item) {
            var value = item[textField];
            var $opt = $("<option>").text(value);
            
            if($.inArray(value, selected) > -1) {
                $opt.attr("selected", "selected");
            }
            
            $result.append($opt);
        });
        
        return $result;
    },
    
    insertTemplate: function() {
        var insertControl = this._insertControl = this._createSelect();
        
        setTimeout(function() {
            insertControl.multiSelect({
                minWidth: 140
            }); 
        });
        
        return insertControl;
    },
    
    editTemplate: function(value) {
        var editControl = this._editControl = this._createSelect(value);
        
        setTimeout(function() {
            editControl.multiSelect({
                minWidth: 140
            });
        });
        
        return editControl;
    },
    
    insertValue: function() {
        return this._insertControl.find("option:selected").map(function() {    
            return this.selected ? $(this).text() : null;
        });
    },
    
    editValue: function() {
        return this._editControl.find("option:selected").map(function() {    
            return this.selected ? $(this).text() : null;
        });
    }
    
});

jsGrid.fields.multiselect = MultiselectField;

function shallow_copy_data(mainObj) {
    let objCopy = {}; // objCopy will store a copy of the mainObj
    let key;
  
    for (key in mainObj) {
        if (mainObj.hasOwnProperty(key)) {
            objCopy[key] = mainObj[key]; // copies each property to the objCopy object
        }
    }
    return objCopy;
  }

function cloneRosterEntry(item, callback) {
    var clone = shallow_copy_data(item);
    delete clone.id;
    $.ajax({
        type: "POST",
        url: "/api/rosterentry",
        contentType: "application/json",
        data: JSON.stringify(clone),
    }).done(function(response) {
        console.log("got em");
        callback(response);
    });
}

function update_data(item) {
    var d = $.Deferred();
    console.log(item);
    var clean_item = {};
    clean_item['specialization_id'] = item.specialization_id;
    clean_item['figure_id'] = item.figure_id;
    clean_item['wargear'] = [];
    for (var i = 0; i < item['wargear'].length; i++) {
        var wg = item.wargear[i];
        clean_item['wargear'].push(wg);
    }
    clean_item['name'] = item.name;
    $.ajax({
        type: "PUT",
        url: "/api/rosterentry/" + item.id,
        contentType: "application/json",
        data: JSON.stringify(clean_item),
    }).done(function(response) {
        d.resolve(response);
    });
    return d.promise();
}

function delete_data(item) {
    return $.ajax({
        type: "DELETE",
        url: "/api/rosterentry/" + item.id,
    });
}

function insert_data(item) {
    var d = $.Deferred();
    var clean_item = {};
    clean_item['specialization_id'] = item.specialization_id;
    clean_item['figure_id'] = item.figure_id;
    clean_item['wargear'] = [];
    for (var i = 0; i < item['wargear'].length; i++) {
        var wg = item.wargear[i];
        clean_item['wargear'].push(wg);
    }
    clean_item['name'] = item.name;
    $.ajax({
        type: "POST",
        url: "/api/rosterentry",
        contentType: "application/json",
        data: JSON.stringify(clean_item),
    }).done(function(response) {
        d.resolve(response);
    });
    return d.promise();
}



function initialize_roster_entry_grid(entry_grid_id, roster_id) {
    $.get('/api/wargear', null, function(data, stuff, stuff) {
        var wargear = data['objects'];
        var wargear_id_map = {};
        for (var w = 0; w <wargear.length; w++) {
            var wg = wargear[w];
            wargear_id_map[wg.id] = wg;
        }
        console.log(wargear_id_map);
        var gs = "#" + entry_grid_id;
        function load_data(filter) {
            var pageIndex = $(gs).data('JSGrid').pageIndex;
            var pageSize = $(gs).data('JSGrid').pageSize;
            var d = $.Deferred();
            $.ajax({
                url: "/api/roster/" + roster_id + "/entries?page=" + pageIndex + "&results_per_page=" + pageSize,
                dataType: "json"
            }).done(function(response) {
                console.log(response);
                var data = response['objects'];
                // for (var i = 0; i < data.length; i++) {
                //     data[i]['verb'] = VERBS.indexOf(data[i]['verb'])
                // }
                d.resolve(data);
            });
        
            return d.promise();
        }

        $(gs).jsGrid({
            width: "100%",
            sorting: false,
            paging: true,
            autoload: true,
            inserting: true,
            pageSize: 20,
            editing: true,
            controller: {
                loadData: load_data,
                updateItem: update_data,
                deleteItem: delete_data,
                insertItem: insert_data
            },
            fields: [
                { name: "id", visible: false},
                { name: "name", type: "text"},
                { name: "figure_id", type: "select", width: 200, itemTemplate: function(value, item) {
                    return $('<div>')
                                .addClass('figure-field')
                                .attr('id', 'roster-entry-' + item['id'] + '-figure-field')
                                .text(item['figure']['figure_type'] + ' ' + item['figure']['figure_name']);
                }, editTemplate: function(value, item) {
                    
                    var sel_id = 'roster-entry-' + item['id'] + '-figure-select';
                    var sel = $('<select>')
                                    .addClass('figure-select-field chosen-select')
                                    .attr('id', sel_id);
                    $.get('/api/figure', null, function(data, textStatus, jqXHR ) {
                        $(data['objects']).each(function() {
                            sel.append($("<option>").attr('value',this.id).text(this.figure_type + ' ' + this.figure_name));
                        });
                        if (value) {
                            sel.val(value);
                        }
                        sel.chosen();
                    });

                    this.editControl = sel;
                    return sel;
                }, insertTemplate: function() {
                    
                    var sel_id = 'roster-entry-insert-figure-select';
                    var sel = $('<select>')
                                    .addClass('figure-select-field chosen-select')
                                    .attr('id', sel_id);
                    $.get('/api/figure', null, function(data, textStatus, jqXHR ) {
                        $(data['objects']).each(function() {
                            sel.append($("<option>").attr('value',this.id).text(this.figure_type + ' ' + this.figure_name));
                        });
                        sel.chosen();
                    });
                    this.editControl = this._insertControl = this.insertControl = sel;
                    return sel;
                }},
                { name: "specialization_id", type: "select", itemTemplate: function(value, item) {
                    var spec = '';
                    if (value) {
                        spec = item['specialization']['name'];
                    }
                    return $('<div>')
                                .addClass('specialization-field chosen-select')
                                .attr('id', 'roster-entry-' + item['id'] + '-specialization-field')
                                .text(spec);
                }, editTemplate: function(value, item) {
                    
                    var sel_id = 'roster-entry-' + item['id'] + '-specialization-select';
                    var sel = $('<select>')
                                    .addClass('specialization-select-field chosen-select')
                                    .attr('id', sel_id);
                    $.get('/api/specialization', null, function(data, textStatus, jqXHR ) {
                        console.log(data);
                        console.log(sel_id);
                        $(data['objects']).each(function() {
                            sel.append($("<option>").attr('value',this.id).text(this.name));
                        });
                        if (value) {
                            sel.val(value);
                        }
                        sel.chosen();
                    });
                    this.editControl = sel;

                    return sel;
    
                }, insertTemplate: function() {
                    
                    var sel_id = 'roster-entry-insert-specialization-select';
                    var sel = $('<select>')
                                    .addClass('specialization-select-field chosen-select')
                                    .attr('id', sel_id);
                    $.get('/api/specialization', null, function(data, textStatus, jqXHR ) {
                        $(data['objects']).each(function() {
                            sel.append($("<option>").attr('value',this.id).text(this.name));
                        });
                        sel.chosen();
                    });
                    this.editControl = this._insertControl = this.insertControl = sel;
                    return sel;
    
                }},
                // { name: "wargear", itemTemplate: function(value, item) {
                //     var wargear_str = ''
                //     if (value) {
                //         for (var i = 0; i < value.length; i++) {
                //             wargear_str += value[i]['name'] + '\n';
                //         }
                //     }
                //     return $('<div>')
                //                 .addClass('wargear-field')
                //                 .attr('id', 'roster-entry-' + item['id'] + '-wargear-field')
                //                 .text(wargear_str);
                // }},
                { name: "wargear", type: "select", width: 250, align: "center", items: wargear, textField: "name", valueField: "id",
                editValue: function() {
                    var values = this.editControl.find("option:selected").map(function() {    
                        var selected_val = this.selected ? $(this).val() : null;
                        var selected = wargear_id_map[selected_val];
                        delete selected.roster_entries;
                        delete selected.prevObject;
                        return selected;
                    });
                    console.log('values')
                    console.log(values);
                    return values;
                }, insertValue: function() {
                    var values = this._insertControl.find("option:selected").map(function() {    
                        var selected_val = this.selected ? $(this).val() : null;
                        var selected = wargear_id_map[selected_val];
                        delete selected.roster_entries;
                        delete selected.prevObject;
                        return selected;
                    });
                    console.log('values')
                    console.log(values);
                    return values;
                }, itemTemplate: function(value, item) {
                    var s = '';
                    for (var i = 0; i < value.length; i++) {
                        s += value[i].name + ' ' + (value[i].profile ? value[i].profile : '') + '<br />';
                    }
                    return '<div>' + s + '</div>';
                }, editTemplate: function(value, item) {
                    console.log('inside edit template');
                    console.log(value);
                    console.log(item);
                    var sel_id = 'roster-entry-' + item['id'] + '-wargear-select';
                    var sel = $('<select>')
                                    .addClass('wargear-select-field form-control')
                                    .prop('multiple', 'true')
                                    .attr('id', sel_id);
                    if (item['figure_id'] != null) {
                        $.get('/api/figure/' + item['figure_id'] + '/allowed_wargear', null, (resp) => {
                            var objects = resp['objects'];
                            if (objects.length > 0) {
                                console.log("Found allowed list");
                                $(resp['objects']).each(function() {
                                    sel.append($("<option>").attr('value',this.id).text(this.name));
                                    
                                });
                                var sel_vals = [];
                                for (var i = 0; i < value.length; i++) {
                                    sel_vals.push(value[i].id);
                                }
                                sel.val(sel_vals);
                                sel.chosen();
                            }
                            else {
                                $.get('/api/wargear', null, function(data, textStatus, jqXHR ) {
                            
                                    $(data['objects']).each(function() {
                                        sel.append($("<option>").attr('value',this.id).text(this.name));
                                        
                                    });
                                    var sel_vals = [];
                                    for (var i = 0; i < value.length; i++) {
                                        sel_vals.push(value[i].id);
                                    }
                                    sel.val(sel_vals);
                                    sel.chosen();
                                });
                            }
                        });
                    }
                    else {
                        $.get('/api/wargear', null, function(data, textStatus, jqXHR ) {
                            
                            $(data['objects']).each(function() {
                                sel.append($("<option>").attr('value',this.id).text(this.name));
                                
                            });
                            var sel_vals = [];
                            for (var i = 0; i < value.length; i++) {
                                sel_vals.push(value[i].id);
                            }
                            sel.val(sel_vals);
                            sel.chosen();
                        });
                    }
                    this.editControl = sel;

                    return sel;
    
                }, insertTemplate: function() {
                    var sel_id = 'roster-entry-insert-wargear-select';
                    var sel = $('<select>')
                                    .addClass('wargear-select-field form-control')
                                    .prop('multiple', 'true')
                                    .attr('id', sel_id);
                    $.get('/api/wargear', null, function(data, textStatus, jqXHR ) {
                        
                        $(data['objects']).each(function() {
                            sel.append($("<option>").attr('value',this.id).text(this.name));
                            
                        });
                        sel.chosen();
                    });
                    
                    this.editControl = this._insertControl = this.insertControl = sel;

                    return sel;
    
                }  },
                { name: "points" },
                { name: "control", width: 100, type: "control", itemTemplate: function(value, item) {
                    var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);

                    var $customButton = $("<button>")
                                            .addClass('btn-info')
                                            .attr('type', 'button')
                                            .text('CLONE')
                                            .click(function(e) {
                                                cloneRosterEntry(item, (r) => {$(gs).jsGrid('render');});
                                                e.stopPropagation();
                                            });

                    return $result.add($customButton);
                }, }
            ]
        });
    });
    
}


function initialize_roster_grid(roster_grid_id) {

    function load_roster(filter) {
        var pageIndex = $(gs).data('JSGrid').pageIndex;
        var pageSize = $(gs).data('JSGrid').pageSize;
        var d = $.Deferred();
        $.ajax({
            url: "/api/roster?" + "page=" + pageIndex + "&results_per_page=" + pageSize,
            dataType: "json"
        }).done(function(response) {
            var data = response['objects'];
            d.resolve(data);
        });
    
        return d.promise();
    }

    function update_roster(item) {
        var d = $.Deferred();
        $.ajax({
            type: "PUT",
            url: "/api/roster/" + item.id,
            contentType: "application/json",
            data: JSON.stringify(item),
        }).done(function(response) {
            d.resolve(response);
        });
        return d.promise();
    }

    function delete_roster(item) {
        return $.ajax({
            type: "DELETE",
            url: "/api/roster/" + item.id,
        });
    }

    function insert_roster(item) {
        var d = $.Deferred();
        $.ajax({
            type: "POST",
            url: "/api/roster",
            contentType: "application/json",
            data: JSON.stringify(item),
        }).done(function(response) {
            d.resolve(response);
        });
        return d.promise();
    }

    var gs = "#" + roster_grid_id;
    $(gs).jsGrid({
        width: "100%",
        sorting: false,
        paging: true,
        autoload: true,
        inserting: true,
        pageSize: 20,
        editing: true,
        controller: {
            loadData: load_roster,
            updateItem: update_roster,
            deleteItem: delete_roster,
            insertItem: insert_roster
        },
        fields: [
            { name: "id", visible: false},
            { name: "name", type: "text", itemTemplate: function(value, item) {
                return $('<a>')
                            .attr('href', '/roster/' + item.id)
                            .text(value);
            }},
            { type: "control" }
        ]
    });
}