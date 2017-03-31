using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DX_DAHERCMS
{
    public enum ReportEdditingMode { NewReport, ModifyReport,OpenReport };
    public class DesignerTask
    {
        public ReportEdditingMode mode { get; set; }
        public string reportID { get; set; }
    }
}