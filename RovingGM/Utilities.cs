using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RovingGM
{
    public class Utilities
    {
        public static int MakeInteger(string input)
        {
            int convertedValue = 0;
            int result = 0;
            bool isNumeric = int.TryParse(input, out result);
            if (isNumeric && input != string.Empty && input != null)
            {
                input = (input.Replace("$", ""));
                //remove decimal places
                if (input.IndexOf(".") > 0)
                    input = input.Remove(input.IndexOf("."), input.Length - input.IndexOf("."));

                convertedValue = Convert.ToInt32(input);
            }
            return convertedValue;
        }

        public static decimal MakeDecimal(string input)
        {
            decimal convertedValue = 0M;
            if (input != string.Empty && input != null)
                convertedValue = Math.Round(Convert.ToDecimal(input), 2);
            //String.Format("{0:.##}", convertedValue);
            return convertedValue;
        }

        public static DateTime MakeDateTime(string input)
        {
            DateTime convertedValue = DateTime.Now;

            if (input != string.Empty && input != null)
                convertedValue = Convert.ToDateTime(input);
            return convertedValue;
        }

        public static Decimal PreventDivideByZero(decimal numerator, decimal denominator)
        {
            decimal result = 0M;
            if (denominator != 0M)
                result = numerator / denominator;
            return result;
        }

        public static string TwoDecimals(object dt)
        {
            return Math.Round(Convert.ToDecimal(dt), 2).ToString();
        }

        public static string ProfitPerUnit(string num, string denom)
        {
            decimal ratio = Utilities.PreventDivideByZero(Utilities.MakeDecimal(num), Utilities.MakeDecimal(denom));
            return Math.Round(Convert.ToDecimal(ratio), 0).ToString();
        }
    }
}