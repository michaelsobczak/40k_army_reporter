function load_data(filter) {
    var pageIndex = $("#action_grid").data('JSGrid').pageIndex;
    var pageSize = $("#action_grid").data('JSGrid').pageSize;
    var d = $.Deferred();
    $.ajax({
        url: "/api/command/{{ command.id }}/actions?page=" + pageIndex + "&page_size=" + pageSize,
        dataType: "json"
    }).done(function(response) {
        console.log(response);
        var data = response['objects'];
        for (var i = 0; i < data.length; i++) {
            data[i]['verb'] = VERBS.indexOf(data[i]['verb'])
        }
        d.resolve(data);
    });

    return d.promise();
}

function update_data(item) {

    item['command_id'] = 7;
    item['verb'] = VERBS[item['verb']];
    var d = $.Deferred();
    $.ajax({
        type: "PUT",
        url: "/api/action/" + item.id,
        contentType: "application/json",
        data: JSON.stringify(item),
    }).done(function(response) {
        response['verb'] = VERBS.indexOf(response['verb']);
        d.resolve(response);
    });
    return d.promise();
}

function delete_data(item) {
    return $.ajax({
        type: "DELETE",
        url: "/api/action/" + item.id,
    });
}

function insert_data(item) {
    item['command_id'] = 7;
    item['id'] = undefined;
    item['verb'] = VERBS[item['verb']];
    
    var d = $.Deferred();
    $.ajax({
        type: "POST",
        url: "/api/action",
        contentType: "application/json",
        data: JSON.stringify(item),
    }).done(function(response) {
        response['verb'] = VERBS.indexOf(response['verb']);
        d.resolve(response);
    });

    return d.promise();
}



function initialize_roster_entry_grid(entry_grid_id, roster_id) {
    $("#" + entry_grid_id).jsGrid({
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
            { name: "figure"},
            { name: "specialization"},
            { name: "wargear"},
            { name: "control", type: "control" }
        ]
    });
}