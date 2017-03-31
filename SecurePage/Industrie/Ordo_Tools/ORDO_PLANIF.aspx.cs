﻿using System;
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
using System.Text;
using System.Drawing;

namespace DX_DAHERCMS
{
    public partial class ORDO_PLANIF_FLORIDES : System.Web.UI.Page
    {
        public static string Param_FiltreMP;

        protected void Page_Load(object sender, EventArgs e)
        {
           
    
     
            RadScheduler1.TimelineView.NumberOfSlots = 5;
            RadScheduler1.AllowEdit = true;
            RadScheduler1.AllowInsert = false;
            RadScheduler1.AllowDelete = false;
            txtTypo.Text = Request.QueryString["Id"];


            DataView dv = (DataView)DS_Compteur.Select(DataSourceSelectArguments.Empty);
            dv.RowFilter = "Planif = 0";
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            object sumObject;
            sumObject = dt.Compute("Sum(nb_ligne)", "");
    
            DataView dv2 = (DataView)DS_Compteur.Select(DataSourceSelectArguments.Empty);
            DataTable dt2 = new DataTable();
            dt2 = dv2.ToTable();
            object sumObject2;
            sumObject2 = dt2.Compute("Sum(nb_ligne)", "");

            txtCompteur.Text = " Reste à planifier: " + sumObject.ToString() ;

        }

        protected void RadScheduler1_TimeSlotCreated(object sender, Telerik.Web.UI.TimeSlotCreatedEventArgs e)
        {

            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["laboConnectionString"].ConnectionString);
            //string qry = "SELECT T_Ordo_Appointments_DragAndDrop.Start, SUM(T_Ordo_Appointments_DragAndDrop.NB_LIGNE) AS Total, T_Ordo_TypeOrdo.Type_Ordo ";
            //qry = qry + "FROM            T_Ordo_Appointments_DragAndDrop INNER JOIN T_Ordo_TypeOrdo ON T_Ordo_Appointments_DragAndDrop.Magasin_Prenant = T_Ordo_TypeOrdo.Designation_Gare ";
            //qry = qry + "GROUP BY T_Ordo_Appointments_DragAndDrop.Start, T_Ordo_Appointments_DragAndDrop.[End],T_Ordo_TypeOrdo.Type_Ordo ";
            //qry = qry + "HAVING        (T_Ordo_Appointments_DragAndDrop.Start IS NOT NULL) AND (T_Ordo_TypeOrdo.Type_Ordo LIKE '" + Request.QueryString["Id"] + "') ";
            //qry = qry + "AND (T_Ordo_Appointments_DragAndDrop.Start > '" + RadScheduler1.VisibleRangeStart + "') ";
            //qry = qry + "AND (T_Ordo_Appointments_DragAndDrop.[End] > '" + RadScheduler1.VisibleRangeEnd + "')";
            //qry = qry + "ORDER BY T_Ordo_Appointments_DragAndDrop.Start;";
            //momo.Text = qry;
            //var cmd = new SqlCommand(qry, con);
            //cmd.CommandType = CommandType.Text;




            RadScheduler scheduler = (RadScheduler)sender;
            if (scheduler.SelectedView == SchedulerViewType.TimelineView)
            {
                //con.Open();
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataView dv = (DataView)DS_TotalJour.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();
                //DataTable dtr = dt;
                //Object Compteur = dt.Compute("Sum(Nb_ligne)", "");
                //da.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {                  
                    //if (DateTime.Compare(e.TimeSlot.Start.Date, Convert.ToDateTime(row["Start"])) == 0)  
                    if (e.TimeSlot.Start.Date.ToShortDateString() == Convert.ToDateTime(row["Start"]).ToShortDateString())                      
                    {
                        Label countLabel = new Label();
                        countLabel.Text = "OT Total:" + row["Total"];                        
                        e.TimeSlot.Control.Controls.AddAt(0, countLabel);
                    }
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

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open();
            SqlCommand sqlComm2 = new SqlCommand();
            sqlComm2 = connection.CreateCommand();
            sqlComm2.CommandText = @"UPDATE [dbo].[T_Ordo]  SET  [Statut] = 1  WHERE AppointmentID = '" + id + "'";
            sqlComm2.ExecuteNonQuery();

            SqlCommand sqlComm3 = new SqlCommand();
            sqlComm3 = connection.CreateCommand();
            sqlComm3.CommandText = @"UPDATE [dbo].[T_Ordo_Appointments_DragAndDrop]  SET  [Due] = GETDATE()  WHERE AppointmentID = '" + id + "'";
            sqlComm3.ExecuteNonQuery();

            DateTime dueDate = DateTime.UtcNow;

            ScheduleAppointment(id, subject, slot.Start, slot.Start.Add(duration), dueDate);
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

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open();
            SqlCommand sqlComm2 = new SqlCommand();
            sqlComm2 = connection.CreateCommand();
            sqlComm2.CommandText = @"UPDATE [dbo].[T_Ordo]  SET  [Statut] = 0 WHERE AppointmentID = '" + id + "'";
            sqlComm2.ExecuteNonQuery();
            
            view.Update(keys, data, new OrderedDictionary(), OnDataSourceOperationComplete);
        }

        private void ScheduleAppointment(int id, string subject, DateTime start, DateTime end, DateTime dueDate)
        {
            IDataSource dataSource = SchedulerDataSource;
            DataSourceView view = dataSource.GetView("DefaultView");       

            IOrderedDictionary data = new OrderedDictionary();
            data.Add("Subject", subject);
            data.Add("Start", start);
            data.Add("End", end);
            data.Add("Due", dueDate);
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

        protected void SchedulerDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@RangeStart"].Value = RadScheduler1.VisibleRangeStart.ToShortDateString();
            e.Command.Parameters["@RangeEnd"].Value = RadScheduler1.VisibleRangeEnd.ToShortDateString() ;
        }

        private static void FilterAppointment(Appointment appointment, ICheckBoxControl checkBox, int resourceId)
        {
            if (appointment.Resources.GetResource("column1", resourceId) != null && checkBox.Checked)
            {
               
                appointment.Visible = true;
            }
        }

        protected void btnToggle_Click(object sender, EventArgs e)
        {
            RadScheduler1.Rebind();
        }

        public static void ShowCheckedItems(RadComboBox comboBox)
        {
            var sb = new StringBuilder();
            var collection = comboBox.CheckedItems;

            if (collection.Count != 0)
            {


                foreach (var item in collection)
                    sb.Append("'" + item.Text + "'" + ",");

                //sb.Append(",");
                string string1 = sb.ToString();
                string string2 = string1.Substring(0, string1.Length - 1);
                
                Param_FiltreMP = string2;

            }
            else
            {
                Param_FiltreMP = "<p>No items selected</p>";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ShowCheckedItems(cb_MP);
            itemsClientSide.Text = Param_FiltreMP;
            
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            //Is it a GridDataItem
            if (e.Item is GridDataItem)
            {
                //Get the instance of the right type
                GridDataItem dataBoundItem = e.Item as GridDataItem;

                //Check the formatting condition
                if (dataBoundItem["RESA"].Text.Trim().Contains("RESA"))
                {
                    dataBoundItem.CssClass = "CSSGrid";
                    //dataBoundItem["Received"].Font.Bold = true;
                    //Customize more...
                }
            }
        }
        
    }
}
