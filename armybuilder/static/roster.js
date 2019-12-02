



function update_data(item) {
    var d = $.Deferred();
    $.ajax({
        type: "PUT",
        url: "/api/rosterentry/" + item.id,
        contentType: "application/json",
        data: JSON.stringify(item),
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
    $.ajax({
        type: "POST",
        url: "/api/rosterentry",
        contentType: "application/json",
        data: JSON.stringify(item),
    }).done(function(response) {
        d.resolve(response);
    });
    return d.promise();
}



function initialize_roster_entry_grid(entry_grid_id, roster_id) {

    var gs = "#" + entry_grid_id;
    function load_data(filter) {
        var pageIndex = $(gs).data('JSGrid').pageIndex;
        var pageSize = $(gs).data('JSGrid').pageSize;
        var d = $.Deferred();
        $.ajax({
            url: "/api/roster/" + roster_id + "/entries?page=" + pageIndex + "&page_size=" + pageSize,
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
            { name: "figure_id", type: "select", itemTemplate: function(value, item) {
                return $('<div>')
                            .addClass('figure-field')
                            .attr('id', 'roster-entry-' + item['id'] + '-figure-field')
                            .text(item['figure']['figure_type'] + ' ' + item['figure']['figure_name']);
            }, editTemplate: function(value, item) {
                
                var sel_id = 'roster-entry-' + item['id'] + '-figure-select';
                var sel = $('<select>')
                                .addClass('figure-select-field')
                                .attr('id', sel_id);
                $.get('/api/figure', null, function(data, textStatus, jqXHR ) {
                    $(data['objects']).each(function() {                        if (value) 
                        sel.append($("<option>").attr('value',this.id).text(this.figure_type + ' ' + this.figure_name));
                        if (value) {
                            sel.val(value);
                        }
                    });
                });

                this.editControl = sel;
                return sel;
            }},
            { name: "specialization_id", type: "select", itemTemplate: function(value, item) {
                var spec = '';
                if (value) {
                    spec = item['specialization']['name'];
                }
                return $('<div>')
                            .addClass('specialization-field')
                            .attr('id', 'roster-entry-' + item['id'] + '-specialization-field')
                            .text(spec);
            }, editTemplate: function(value, item) {
                
                var sel_id = 'roster-entry-' + item['id'] + '-specialization-select';
                var sel = $('<select>')
                                .addClass('specialization-select-field')
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
                });
                this.editControl = sel;

                return sel;
  
            }},
            { name: "wargear", itemTemplate: function(value, item) {
                var wargear_str = ''
                if (value) {
                    for (var i = 0; i < value.length; i++) {
                        wargear_str += value[i]['name'] + '\n';
                    }
                }
                return $('<div>')
                            .addClass('wargear-field')
                            .attr('id', 'roster-entry-' + item['id'] + '-wargear-field')
                            .text(wargear_str);
            }},
            { name: "control", type: "control" }
        ]
    });
}