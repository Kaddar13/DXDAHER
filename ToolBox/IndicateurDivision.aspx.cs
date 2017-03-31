using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGauges.Gauges.Linear;
using DevExpress.Web.ASPxGauges;
using DevExpress.XtraGauges.Core.Model;
using System.Data;
using DevExpress.Web.ASPxGauges.Gauges.Circular;
using DevExpress.Web.ASPxGauges.Gauges;
using DevExpress.XtraGauges.Core.Drawing;
using System.Drawing;

namespace DX_DAHERCMS.ToolBox
{
    public partial class IndicateurDivision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            UpdateGauge();


        }
        private void SetupDataSourceInternal()
        {
            SqlDataSource1.ConnectionString = "Data Source=(local);Initial Catalog=Industrie_Magasin;User ID=iis;Password=Aa123456";
            SqlDataSource1.DataSourceMode = System.Web.UI.WebControls.SqlDataSourceMode.DataSet;
        }
        private void UpdateGauge()
        {
            //SetupDataSourceInternal();
            UpdateScaleInternal(gaugeS32, 0);
            UpdateScaleInternal(gaugeS21, 1);
            UpdateScaleInternal(gaugeS11, 2);
            UpdateScaleInternal(gaugeS31, 3);
        }
        private void UpdateScaleInternal(ASPxGaugeControl gauge, int Row)
        {
            float oldValue = ((CircularGauge)gauge.Gauges[0]).Scales[0].Value;

            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            float newValue = Convert.ToSingle(dv.Table.Rows[Row][0]);
            float maxValue = Convert.ToSingle(dv.Table.Rows[Row][1]);


            if (oldValue != newValue)
            {
                ((CircularGauge)gauge.Gauges[0]).Scales[0].MinValue = (newValue / maxValue) * 100 - 5;
                ((CircularGauge)gauge.Gauges[0]).Scales[0].MaxValue = 100;
                ((CircularGauge)gauge.Gauges[0]).Needles[0].Value = (newValue / maxValue) * 100;
                float f = (newValue / maxValue) * 100;
                string s = f.ToString("0.0");

                LabelComponent label = new LabelComponent("myLabel");
                label.Text = s+'%';
                label.AppearanceText.TextBrush = new SolidBrushObject(Color.Black);
                label.AppearanceText.Font = new Font("Tahoma", 12F);
                ((CircularGauge)gauge.Gauges[0]).Labels.Add(label);

                ArcScaleRangeWeb range1 = new ArcScaleRangeWeb();
                range1.Name = "Plage1";
                range1.AppearanceRange.ContentBrush = new SolidBrushObject(Color.Red);
                //range1.AppearanceRange.BorderBrush = new SolidBrushObject("Color:#A0A0A0");
                range1.StartValue = (newValue / maxValue) * 100 - 5;
                range1.EndValue = 100;
                range1.ShapeOffset = 0;

                ArcScaleRangeWeb range2 = new ArcScaleRangeWeb();
                range2.Name = "Plage2";
                range2.AppearanceRange.ContentBrush = new SolidBrushObject(Color.Orange);
                //range2.AppearanceRange.BorderBrush = new SolidBrushObject("Color:#A0A0A0");
                range2.StartValue = (newValue / maxValue) * 100 - 5;
                range2.EndValue = 98;
                range2.ShapeOffset = 0;

                ArcScaleRangeWeb range3 = new ArcScaleRangeWeb();
                range3.Name = "Plage3";
                range3.AppearanceRange.ContentBrush = new SolidBrushObject(Color.Green);
                //range3.AppearanceRange.BorderBrush = new SolidBrushObject("Color:#A0A0A0");
                range3.StartValue = (newValue / maxValue) * 100 - 5;
                range3.EndValue = 95;
                range3.ShapeOffset = 0;

                ArcScaleComponent scale = ((CircularGauge)gauge.Gauges[0]).Scales[0];
                scale.Ranges.AddRange(new ArcScaleRange[] { range1, range2, range3 });



                gauge.DataBind();
            }
        }
        protected void timer_Tick(object sender, EventArgs e)
        {
            UpdateGauge();
        }
    }
}