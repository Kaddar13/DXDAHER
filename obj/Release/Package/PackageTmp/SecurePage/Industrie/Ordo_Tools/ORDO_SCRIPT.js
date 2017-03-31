(function () {

    var demo = window.demo = window.demo || {};

    window.rowDropping = function (sender, eventArgs) {
        // Fired when the user drops a grid row
        var htmlElement = eventArgs.get_destinationHtmlElement();

        if (isPartOfSchedulerAppointmentArea(htmlElement)) {
            // The row was dropped over the scheduler appointment area
            // Find the exact time slot and save its unique index in the hidden field
            var timeSlot;

            if ($telerik.$(htmlElement).parents(".rsApt").length != 0)
                timeSlot = demo.scheduler.getAppointmentFromDomElement(htmlElement).get_timeSlot();
            else
                timeSlot = demo.scheduler._activeModel.getTimeSlotFromDomElement(htmlElement);

            $get(demo.targetSlotHiddenFieldId).value = timeSlot.get_index();

            // The HTML needs to be set in order for the postback to execute normally
            eventArgs.set_destinationHtmlElement(demo.targetSlotHiddenFieldId);
        }
        else {
            // The node was dropped elsewhere on the document
            eventArgs.set_cancel(true);
        }
    }

    function isPartOfSchedulerAppointmentArea(htmlElement) {
        // Determines if an HTML element is part of the scheduler appointment area
        // This can be either the rsContent or the rsAllDay div (in day and week view)
        return $telerik.$(htmlElement).parents().is("div.rsAllDay") ||
                    $telerik.$(htmlElement).parents().is("div.rsContent")
    }

    window.onRowDoubleClick = function (sender, args) {
        sender.get_masterTableView().editItem(args.get_itemIndexHierarchical());
    }
}());
