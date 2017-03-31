using System;
using System.Collections;
using System.Collections.Specialized;
using System.Web.UI;
using Telerik.Web.UI;
using Telerik.Web.UI.Scheduler.Views;
using System.Globalization;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;

namespace DX_DAHERCMS
{
    public partial class ORDO_PLANIF_FLORIDES : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            RadScheduler1.TimelineView.NumberOfSlots = 5;
            RadScheduler1.AllowEdit = true;
            RadScheduler1.AllowInsert = false;
            RadScheduler1.AllowDelete = false;
            txtTypo.Text = Request.QueryString["Id"];
            RadScheduler1.Rebind();


        }

        protected void RadScheduler1_TimeSlotCreated(object sender, TimeSlotCreatedEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["laboConnectionString"].ConnectionString);
            string qry = "SELECT T_Ordo_Appointments_DragAndDrop.Start, SUM(T_Ordo_Appointments_DragAndDrop.NB_LIGNE) AS Total, T_Ordo_TypeOrdo.Type_Ordo ";
            qry = qry + "FROM            T_Ordo_Appointments_DragAndDrop INNER JOIN T_Ordo_TypeOrdo ON T_Ordo_Appointments_DragAndDrop.Magasin_Prenant = T_Ordo_TypeOrdo.Designation_Gare ";
            qry = qry + "GROUP BY T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_TypeOrdo.Type_Ordo ";
            qry = qry + "HAVING        (T_Ordo_Appointments_DragAndDrop.Start IS NOT NULL) AND (T_Ordo_TypeOrdo.Type_Ordo LIKE '" + Request.QueryString["Id"] + "')";
            qry = qry + "ORDER BY T_Ordo_Appointments_DragAndDrop.Start;";
            var cmd = new SqlCommand(qry, con);
            cmd.CommandType = CommandType.Text;
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);



            foreach (DataRow row in dt.Rows)
            {
                if (DateTime.Compare(e.TimeSlot.Start.Date, Convert.ToDateTime(row["Start"])) == 0)
                {
                    Label countLabel = new Label();

                    countLabel.Text = "OT Total:" + row["Total"];
                    e.TimeSlot.Control.Controls.AddAt(0, countLabel);
                }
            }
        }

        protected void RadScheduler1_AppointmentInsert(object sender, SchedulerCancelEventArgs e)
        {
            e.Appointment.Attributes["Due"] = e.Appointment.Start.AddDays(1).ToString("yyyy/MM/dd HH:mm", CultureInfo.InvariantCulture);
            e.Appointment.Attributes["Priority"] = "Medium";
        }

        protected void RadGrid1_RowDrop(object sender, GridDragDropEventArgs e)
        {
            string targetSlotIndex = TargetSlotHiddenField.Value;
            foreach (var dataItem in e.DraggedItems)
            {

                Hashtable values = new Hashtable();
                dataItem.ExtractValues(values);

                int id = (int)dataItem.GetDataKeyValue("AppointmentID");
                string subject = (string)values["Subject"];
                if (targetSlotIndex != string.Empty)
                {
                    HandleSchedulerDrop(id, subject, targetSlotIndex);
                    TargetSlotHiddenField.Value = string.Empty;
                }

            }

            RadScheduler1.Rebind();
            RadGrid1.Rebind();
            RadAjaxManager1.AjaxSettings.AddAjaxSetting(RadGrid1, RadScheduler1);
        }

        private void HandleSchedulerDrop(int id, string subject, string targetSlotIndex)
        {
            RadScheduler1.Rebind();

            ISchedulerTimeSlot slot = RadScheduler1.GetTimeSlotFromIndex(targetSlotIndex);

            TimeSpan duration = TimeSpan.FromHours(1);
            if (slot.Duration == TimeSpan.FromDays(1))
            {
                duration = slot.Duration;
            }

            ScheduleAppointment(id, subject, slot.Start, slot.Start.Add(duration));
        }

        protected void RadScheduler1_AppointmentCommand(object sender, AppointmentCommandEventArgs e)
        {

            if (e.CommandName == "Unschedule")
            {
                int id = (int)e.Container.Appointment.ID;

                DateTime dueDate = DateTime.Now;

                if (!string.IsNullOrEmpty(e.Container.Appointment.Attributes["Due"]))
                    dueDate = Convert.ToDateTime(e.Container.Appointment.Attributes["Due"]);

                string priority = "Medium";

                if (!string.IsNullOrEmpty(e.Container.Appointment.Attributes["Priority"]))
                    priority = e.Container.Appointment.Attributes["Priority"];

                UnscheduleAppointment(id, e.Container.Appointment.Subject, dueDate, priority);

                RadScheduler1.Rebind();
                RadGrid1.Rebind();

                RadAjaxManager1.AjaxSettings.AddAjaxSetting(RadScheduler1, RadGrid1);
            }
        }

        private void UnscheduleAppointment(int id, string subject, DateTime dueDate, string priority)
        {
            IDataSource dataSource = GridDataSource;
            DataSourceView view = dataSource.GetView("DefaultView");

            IOrderedDictionary data = new OrderedDictionary();
            data.Add("Subject", subject);
            data.Add("Start", null);
            data.Add("End", null);
            data.Add("Due", dueDate);
            data.Add("Priority", priority);

            IDictionary keys = new OrderedDictionary();
            keys.Add("AppointmentID", id);

            view.Update(keys, data, new OrderedDictionary(), OnDataSourceOperationComplete);
        }

        private void ScheduleAppointment(int id, string subject, DateTime start, DateTime end)
        {
            IDataSource dataSource = SchedulerDataSource;
            DataSourceView view = dataSource.GetView("DefaultView");

            IOrderedDictionary data = new OrderedDictionary();
            data.Add("Subject", subject);
            data.Add("Start", start);
            data.Add("End", end);

            IDictionary keys = new OrderedDictionary();
            keys.Add("AppointmentID", id);

            view.Update(keys, data, new OrderedDictionary(), OnDataSourceOperationComplete);
        }

        private static bool OnDataSourceOperationComplete(int count, Exception e)
        {
            if (e != null)
            {
                throw e;
            }
            return true;
        }

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridFooterItem && RadGrid1.MasterTableView.IsItemInserted)
            {
                e.Item.Visible = false;
            }
        }

        protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName)
            {
                e.Canceled = true;
                //Prepare an IDictionary with the predefined values
                ListDictionary newValues = new ListDictionary();
                newValues["Priority"] = "High";
                newValues["Due"] = DateTime.Now;
                newValues["Subject"] = "New task";
                //Insert the item and rebind
                e.Item.OwnerTableView.InsertItem(newValues);
            }
        }

        protected void RadScheduler1_AppointmentDataBound(object sender, SchedulerEventArgs e)
        {

            if (e.Appointment.Attributes["Locke"] == "1")
            {
                e.Appointment.BackColor = System.Drawing.Color.Red;
                e.Appointment.AllowDelete = false;
                e.Appointment.AllowEdit = false;

            }
            if (e.Appointment.Attributes["NB_LIGNE"] == e.Appointment.Attributes["Nb_Traite"])
            {
                e.Appointment.BackColor = System.Drawing.Color.Green;
                e.Appointment.AllowDelete = false;
                e.Appointment.AllowEdit = false;
            }

            
     
        }

        protected void RadScheduler1_AppointmentCreated(object sender, AppointmentCreatedEventArgs e)
        {
            if (e.Appointment.Attributes["Locke"] == "1")
            {
                e.Container.FindControl("UnscheduleAppointment").Visible = false;
            }
            
        }
       
      
    }
}
