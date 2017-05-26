using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DX_DAHERCMS.SecurePage.Rechange.GTI
{
    public class gestRoll
    {
        public string GetNewID1(string num_LastID1, string txt_LastID3)
        {
            string functionReturnValue = null;
            string txt_NewID3 = null;
            int num_NewID1 = 0;
            int LastID1 = 0;
            string new_IDchar = null;
            string old_IDchar = null;

            txt_NewID3 = (txt_LastID3 == "-" ? "A" : txt_LastID3);
            if (num_LastID1 == "-")
            {
                LastID1 = -1;
            }
            else
            {
                LastID1 = Convert.ToInt32(num_LastID1);
            }

            if (txt_LastID3 == "-")
            {
                old_IDchar = "A";
            }
            else
            {
                old_IDchar = txt_LastID3;
            }

            switch (LastID1)
            {
                case 1000:
                    txt_NewID3 = GetNewID3(txt_LastID3);
                    functionReturnValue = "0/" + "2016" + "/" + old_IDchar;
                    break;
                case -1:
                    txt_NewID3 = txt_LastID3;
                    functionReturnValue = "0/" + "2016" + "/" + old_IDchar;
                    break;
                default:
                    num_NewID1 = Convert.ToInt32(num_LastID1) + 1;
                    functionReturnValue = num_NewID1 + "/" + "2016" + "/" + old_IDchar;
                    break;
            }
            return functionReturnValue;


        }

        public string GetNewID3(string txt_LastID3)
        {
            string functionReturnValue = null;

            switch (txt_LastID3)
            {
                case "Z":
                    functionReturnValue = "A";
                    break;
                default:
                    functionReturnValue = Convert.ToString((char)(Convert.ToInt32(txt_LastID3 + 1)));
                    break;
            }
            return functionReturnValue;

        }

        public string GetEndID1(int num_LastID1, string txt_LastID3, int num_CART)
        {
            string functionReturnValue = null;
            string txt_NewID3 = null;
            int num_Roll = 0;
            num_Roll = num_CART * 24;
            int LastID1;
            int num_NewID1;


            if (num_LastID1 >= 976)
            {
                txt_NewID3 = GetNewID3(txt_LastID3);
                functionReturnValue = "0/" + "2016" + "/" + txt_NewID3;

            }
            else if (num_LastID1 == -1)
            {
                txt_NewID3 = txt_LastID3;
                functionReturnValue = "0/" + "2016" + "/" + txt_LastID3;
            }
            else
            {
                num_NewID1 = num_LastID1 + 1;
                functionReturnValue = num_NewID1 + "/" + "2016" + "/" + txt_LastID3;
            }


            return functionReturnValue;


        }

        public int Getnum_IDentier(int num_LastID1, string txt_LastID3)
        {
            int ID_entier = 0;
            switch (txt_LastID3)
            {
                case "A":
                    ID_entier = num_LastID1 + 1;
                    break;
                case "B":
                    ID_entier = num_LastID1 + 984;
                    break;
                case "C":
                    ID_entier = num_LastID1 + 1984;
                    break;
                case "D":
                    ID_entier = num_LastID1 + 2984;
                    break;
                case "E":
                    ID_entier = num_LastID1 + 3984;
                    break;
                case "F":
                    ID_entier = num_LastID1 + 4984;
                    break;
                case "G":
                    ID_entier = num_LastID1 + 5984;
                    break;
                case "H":
                    ID_entier = num_LastID1 + 6984;
                    break;
                case "I":
                    ID_entier = num_LastID1 + 7984;
                    break;
                case "J":
                    ID_entier = num_LastID1 + 8984;
                    break;
                case "K":
                    ID_entier = num_LastID1 + 9984;
                    break;
                case "L":
                    ID_entier = num_LastID1 + 10984;
                    break;
                case "M":
                    ID_entier = num_LastID1 + 11984;
                    break;
                case "N":
                    ID_entier = num_LastID1 + 12984;
                    break;
                case "O":
                    ID_entier = num_LastID1 + 13984;
                    break;
                case "P":
                    ID_entier = num_LastID1 + 14984;
                    break;
                case "R":
                    ID_entier = num_LastID1 + 15984;
                    break;
                case "Q":
                    ID_entier = num_LastID1 + 16984;
                    break;
                case "S":
                    ID_entier = num_LastID1 + 17984;
                    break;
                case "T":
                    ID_entier = num_LastID1 + 18984;
                    break;
                case "U":
                    ID_entier = num_LastID1 + 19984;
                    break;
                case "V":
                    ID_entier = num_LastID1 + 20984;
                    break;
                case "W":
                    ID_entier = num_LastID1 + 21984;
                    break;
                case "X":
                    ID_entier = num_LastID1 + 22984;
                    break;
                case "Y":
                    ID_entier = num_LastID1 + 23984;
                    break;
                case "Z":
                    ID_entier = num_LastID1 + 24984;
                    break;
                default:
                    ID_entier = 0;
                    break;
            }
            return ID_entier;
        }

        public string GetNewID1b(int num_LastID1, string txt_LastID3, int num_Roll)
        {
            int num_IDentier = 0;
            string new_IDchar = null;
            string old_IDchar = null;

            if (txt_LastID3 == "-")
            {
                old_IDchar = "A";
            }
            else
            {
                old_IDchar = txt_LastID3;
            }

            if ((num_Roll + num_LastID1) >= 983)
            {
                num_IDentier = (num_Roll + num_LastID1) - 984;
                if (txt_LastID3 == "Z")
                {
                    new_IDchar = "A";
                }
                else
                {
                    if (Strings.Asc(old_IDchar) == null)
                    {
                        new_IDchar = "1";
                    }
                    else
                    {
                        new_IDchar = Convert.ToString((char)(Convert.ToInt32(old_IDchar + 1)));
                    }

                }
            }
            else if ((num_Roll + num_LastID1) >= 984)
            {
                num_IDentier = (num_LastID1 + num_Roll) - 1;

                if (Strings.Asc(old_IDchar) == null)
                {
                    new_IDchar = "1";
                }
                else
                {
                    new_IDchar = Convert.ToString((char)(Convert.ToInt32(old_IDchar)));
                }



            }
            return num_IDentier + "/" + "2016" + "/" + new_IDchar;

        }

        public long NextID(string lechamp, string latable)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open();
            int nbrow;
            long result= 0;

            using (var command2 = new SqlCommand(@"Select Min([" + lechamp +"]-1) As NextID From " + latable + " As T1  Where ((([" + lechamp + "]-1)>0) And (((Select [" + lechamp + "] From " + latable + " T2 Where T2.[" + lechamp + "]=T1.[" + lechamp + "]-1)) Is Null));", connection))
            {
                
                SqlDataAdapter adaptater= new SqlDataAdapter();
                DataSet ds = new DataSet();
                adaptater.SelectCommand = command2;
                adaptater.Fill(ds, "SqlTemp");
                adaptater.Dispose();
                command2.Dispose();

                nbrow = ds.Tables[0].Rows.Count;

                if (nbrow == 0)
                {
                    result = 1;

                }
                else if (ds.Tables[0].Rows.Count == 0)
                {
                    result = Convert.ToInt32(ds.Tables[0].Compute("Max("+ lechamp +")",""));

                }


               
            }

            return result;

        }

        public int charde(string lettre)
        {
            int functionReturnValue = 0;
            switch (lettre)
            {
                case "A":
                    functionReturnValue = 65;
                    break;
                case "B":
                    functionReturnValue = 66;
                    break;
                case "C":
                    functionReturnValue = 67;
                    break;
                case "D":
                    functionReturnValue = 68;
                    break;
                case "E":
                    functionReturnValue = 69;
                    break;
                case "F":
                    functionReturnValue = 70;
                    break;
                case "G":
                    functionReturnValue = 71;
                    break;
                case "H":
                    functionReturnValue = 72;
                    break;
                case "I":
                    functionReturnValue = 73;
                    break;
                case "J":
                    functionReturnValue = 74;
                    break;
                case "K":
                    functionReturnValue = 75;
                    break;
                case "L":
                    functionReturnValue = 76;
                    break;
                case "M":
                    functionReturnValue = 77;
                    break;
                case "N":
                    functionReturnValue = 78;
                    break;
                case "O":
                    functionReturnValue = 79;
                    break;
                case "P":
                    functionReturnValue = 80;
                    break;
                case "Q":
                    functionReturnValue = 81;
                    break;
                case "R":
                    functionReturnValue = 82;
                    break;
                case "S":
                    functionReturnValue = 83;
                    break;
                case "T":
                    functionReturnValue = 84;
                    break;
                case "U":
                    functionReturnValue = 85;
                    break;
                case "V":
                    functionReturnValue = 86;
                    break;
                case "W":
                    functionReturnValue = 87;
                    break;
                case "X":
                    functionReturnValue = 88;
                    break;
                case "Y":
                    functionReturnValue = 89;
                    break;
                case "Z":
                    functionReturnValue = 90;
                    break;
            }
            return functionReturnValue;


        }


    }
}