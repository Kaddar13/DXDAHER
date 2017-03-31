function getUnderlyingData(args) {
    var underlyingData = [];

    args.RequestUnderlyingData(function (data) {
        dataMembers = data.GetDataMembers();
        for (var i = 0; i < data.GetRowCount(); i++) {
            var dataTableRow = {};
            $.each(dataMembers, function (_, dataMember) {
                dataTableRow[dataMember] = data.GetRowValue(i, dataMember);
            });
            underlyingData.push(dataTableRow);
        }

        var $grid = $('<div/>');
        $grid.dxDataGrid({
            height: 500,
            scrolling: {
                mode: 'virtual'
            },
            dataSource: underlyingData
        });
       
        var popup = $("#myPopup").data("dxPopup");
        $popupContent = popup.content();
        $popupContent.empty();
        $popupContent.append($grid);
        popup.show();
    });
}

function initPopup() {
    $("#myPopup").dxPopup({
        width: 800, height: 600,
        title: "Underlying data",
        showCloseButton: true
    });
}