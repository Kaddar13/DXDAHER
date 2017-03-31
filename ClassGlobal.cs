using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DX_DAHERCMS
{
    public class ClassGlobal
    {
        static string CSVFileReport;
        public static string CheminFichier
        {
            get
            {
                return CSVFileReport;
            }
            set
            {
                CSVFileReport = value;
            }
        }
        static string NomFichier;

        public static string FichierNom
        {
            get
            {
                return NomFichier;
            }
            set
            {
                NomFichier = value;
            }
        }

        static string NomFichierXML;

        public static string FichierNomXML
        {
            get
            {
                return NomFichierXML;
            }
            set
            {
                NomFichierXML = value;
            }
        }

        static string NomFichierTXT;

        public static string FichierNomTXT
        {
            get
            {
                return NomFichierTXT;
            }
            set
            {
                NomFichierTXT = value;
            }
        }

    }
}