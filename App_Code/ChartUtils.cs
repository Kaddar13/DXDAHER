using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using DevExpress.Web;
using DevExpress.XtraCharts;

namespace DX_DAHERCMS
{
        public static class ComboBoxHelper
        {
            const string defaultMarker = "Default";
            const string percentMarker = "%";
            const int defaultDoughnutHole = 60;
            static readonly MarkerKindItemCollection markerKinds = MarkerKindItemCollection.CreateCollection();

            static string[] AppendPercentMarker(string[] items)
            {
                return AppendPercentMarker(items, 0);
            }
            static string[] AppendPercentMarker(string[] items, int startIndex)
            {
                string[] result = new string[items.Length];
                for (int i = 0; i < startIndex; i++)
                    result[i] = items[i];
                for (int i = startIndex; i < items.Length; i++)
                    result[i] = items[i] + percentMarker;
                return result;
            }
            static string DeletePercentMarker(string item)
            {
                return item.TrimEnd(new char[] { percentMarker[0] });
            }
            public static void PrepareComboBox(ASPxComboBox comboBox, string[] items)
            {
                PrepareComboBox(comboBox, items, null);
            }
            public static void PrepareComboBox(ASPxComboBox comboBox, string[] items, object defaultItem)
            {
                comboBox.Items.AddRange(items);
                comboBox.SelectedIndex = defaultItem != null ? comboBox.Items.IndexOfText(defaultItem.ToString()) : 0;
            }
            public static void PrepareComboBox(ASPxComboBox comboBox, double[] items, double defaultItem)
            {
                comboBox.Items.AddRange(items);
                comboBox.SelectedIndex = comboBox.Items.IndexOfText(defaultItem.ToString());
            }
            public static void PrepareComboBox(ASPxComboBox comboBox, Enum defaultValue)
            {
                PrepareComboBox(comboBox, Enum.GetNames(defaultValue.GetType()), defaultValue);
            }
            public static void PrepareComboBox(ASPxComboBox comboBox, IDictionary dictionary)
            {
                PrepareComboBox(comboBox, dictionary, 0);
            }
            public static void PrepareComboBox(ASPxComboBox comboBox, IDictionary dictionary, int selectedIndex)
            {
                foreach (DictionaryEntry entry in dictionary)
                    comboBox.Items.Add((string)entry.Key, entry.Value);
                comboBox.SelectedIndex = selectedIndex;
            }
            public static void PrepareLabelAngleComboBox(ASPxComboBox comboBox, int defaultAngle)
            {
                string[] items = new string[] { "0", "45", "90", "135", "180", "225", "270", "315" };
                PrepareComboBox(comboBox, items, defaultAngle);
            }
            public static void PrepareTransparencyComboBox(ASPxComboBox comboBox, int defaultTransparency)
            {
                string[] items = new string[] { "0", "45", "90", "135", "180", "225", "255" };
                PrepareComboBox(comboBox, items, defaultTransparency);
            }
            public static void PrepareZoomPercentComboBox(ASPxComboBox comboBox, int defaultZoomPercent)
            {
                string[] items = new string[] { "50", "75", "100", "120", "140", "170", "200", "250", "300" };
                PrepareComboBox(comboBox, items, defaultZoomPercent);
            }
            public static void PreparePerspectiveAngleComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { defaultMarker, "0", "30", "45", "60", "90", "120", "135", "150" };
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareBar3DModelComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { "Box", "Cylinder", "Cone", "Pyramid" };
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareNestedDoughnutHolePercentComboBox(ASPxComboBox comboBox)
            {
                const int minRadius = 30;
                const int step = 5;
                const int itemsCount = 8;
                const int defaultHole = 40;
                List<double> items = new List<double>();
                for (int itemIndex = 0; itemIndex < itemsCount; itemIndex++)
                {
                    int radius = minRadius + step * itemIndex;
                    items.Add(radius);
                }
                PrepareComboBox(comboBox, items.ToArray(), defaultHole);
            }
            public static void PrepareNestedDoughnutSeriesArgumentComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { "Age", "Sex" };
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareInnerIndentComboBox(ASPxComboBox comboBox)
            {
                const int itemsCount = 11;
                const int defaultInnerIndent = 5;
                List<double> items = new List<double>();
                for (int itemIndex = 0; itemIndex < itemsCount; itemIndex++)
                {
                    items.Add(itemIndex);
                }
                PrepareComboBox(comboBox, items.ToArray(), defaultInnerIndent);
            }
            public static void PrepareRegressionLineColorComboBox(ASPxComboBox comboBox)
            {
                comboBox.Items.Add("Default");
                Color[] colors = new Color[] { Color.Black, Color.Red, Color.Green, Color.Blue, Color.Yellow };
                foreach (Color color in colors)
                    comboBox.Items.Add(color.Name);
                comboBox.SelectedIndex = 0;
            }
            public static void PrepareDashStyleCombobox(ASPxComboBox comboBox, DashStyle defaultDashStyle)
            {
                foreach (DashStyle dashStyle in Enum.GetValues(defaultDashStyle.GetType()))
                    if (dashStyle != DashStyle.Empty)
                        comboBox.Items.Add(dashStyle.ToString());
                comboBox.SelectedIndex = comboBox.Items.IndexOfText(defaultDashStyle.ToString());
            }
            public static void PrepareLogarithmicBaseComboBox(ASPxComboBox comboBox, double defaultLogarithmicBase)
            {
                string[] items = new string[] { "2", "5", "10", "20", "50", "100" };
                PrepareComboBox(comboBox, items, defaultLogarithmicBase);
            }
            public static void PrepareFunctionTypeComboBox(ASPxComboBox comboBox)
            {
                const string lemniscate = "Lemniscate";
                string[] items = new string[] { "Circles", "Cardioid", lemniscate };
                PrepareComboBox(comboBox, items, lemniscate);
            }
            public static void PrepareFunctionTypeScatterLineComboBox(ASPxComboBox comboBox)
            {
                const string archimedeanSpiral = "Archimedean Spiral";
                string[] items = new string[] { archimedeanSpiral, "Cardioid", "Cartesian Folium", };
                PrepareComboBox(comboBox, items, archimedeanSpiral);
            }
            public static void PrepareChartTypeComboBox(ASPxComboBox comboBox)
            {
                const string line = "Line";
                string[] items = new string[] { line, "Bar" };
                PrepareComboBox(comboBox, items, line);
            }
            public static void PrepareSeriesAxisXComboBox(ASPxComboBox comboBox)
            {
                const string primaryAxis = "Primary Axis X";
                string[] items = new string[] { primaryAxis, "Secondary Axis X" };
                PrepareComboBox(comboBox, items, primaryAxis);
            }
            public static void PrepareSeriesAxisYComboBox(ASPxComboBox comboBox)
            {
                const string secondaryAxisY = "Secondary Axis Y";
                string[] items = new string[] { "Primary Axis Y", secondaryAxisY };
                PrepareComboBox(comboBox, items, secondaryAxisY);
            }
            public static void PrepareViewTypeComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { 
            "Lines", 
            "Stacked Lines",
            "Full-Stacked Lines",
            "Step Lines", 
            "Areas", 
            "Step Areas",
            "Stacked Areas",
            "Full-Stacked Areas",
            "3D Lines",
            "3D Stacked Lines",
            "3D Full-Stacked Lines",
            "3D Step Lines",
            "3D Areas",
            "3D Stacked Areas",
            "3D Full-Stacked Areas",
            "3D Step Areas",
            "Spline",
            "Spline Area",
            "Stacked Spline",
            "Full-Stacked Spline",
            "Spline 3D",
            "Spline Area 3D",
            "Stacked Spline 3D",
            "Full-Stacked Spline 3D" };
                PrepareComboBox(comboBox, items);
            }
            public static void PreparePieViewTypeComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { "Pie", "Pie 3D", "Doughnut", "Doughnut 3D" };
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareMarkerKindComboBox(ASPxComboBox comboBox, MarkerKind defaultKind, int defaultStarPointCount)
            {
                PrepareComboBox(comboBox, markerKinds.GetNames(), markerKinds.FindName(defaultKind, defaultStarPointCount));
            }
            public static void PrepareMarkerSizeComboBox(ASPxComboBox comboBox, int defaultSize)
            {
                PrepareComboBox(comboBox, MarkerKindItemCollection.GetSizeArray(), defaultSize);
            }
            public static void PrepareLegendPercentComboBox(ASPxComboBox comboBox, double defaultPercent)
            {
                string[] items = AppendPercentMarker(new string[] { "25", "50", "75", "100" });
                PrepareComboBox(comboBox, items, defaultPercent.ToString() + percentMarker);
            }
            public static void PrepareLineTensionComboBox(ASPxComboBox comboBox, int defaultLineTension)
            {
                string[] items = AppendPercentMarker(new string[] { "0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100" });
                PrepareComboBox(comboBox, items, defaultLineTension.ToString() + percentMarker);
            }
            public static void PreparePieLabelsComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { "Inside", "Outside", "TwoColumns", "Radial" };
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareDoughnutHolePercentComboBox(ASPxComboBox comboBox)
            {
                string defaultHoleString = defaultMarker + " (" + defaultDoughnutHole.ToString() + "%)";
                string[] items = AppendPercentMarker(new string[] { defaultHoleString, "0", "15", "30", "50", "75", "90", "100" }, 1);
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareExplodedPointsComboBox(ASPxComboBox comboBox, SeriesPointCollection points, bool supportCustom)
            {
                string[] items = PieExplodingHelper.GetNames(points, supportCustom);
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareSummaryFunctionsComboBox(ASPxComboBox comboBox)
            {
                string[] items = new string[] { "SUM", "MIN", "MAX", "AVERAGE", "COUNT", "STDDEV (Custom)" };
                PrepareComboBox(comboBox, items);
            }
            public static void PrepareFunctionTypeScatterRadarLineComboBox(ASPxComboBox comboBox)
            {
                const string archimedeanSpiral = "Archimedean Spiral";
                string[] items = new string[] { archimedeanSpiral, "Polar Rose", "Polar Folium", };
                PrepareComboBox(comboBox, items, archimedeanSpiral);
            }
            public static void PrepareResolveOverlappingModeComboBox(ASPxComboBox comboBox, ResolveOverlappingMode defaultMode)
            {
                PrepareComboBox(comboBox, defaultMode);
            }
            public static Enum GetSelectedItem(ASPxComboBox comboBox, Type enumType)
            {
                if (!enumType.IsEnum)
                    throw new ArgumentException();
                try
                {
                    return (Enum)Enum.Parse(enumType, comboBox.SelectedItem.Text);
                }
                catch
                {
                }
                return (Enum)Enum.Parse(enumType, (string)comboBox.SelectedItem.Value);
            }
            public static ResolveOverlappingMode GetSelectedResolveOverlappingMode(ASPxComboBox comboBox)
            {
                return (ResolveOverlappingMode)GetSelectedItem(comboBox, typeof(ResolveOverlappingMode));
            }
            public static int GetSelectedPerspectiveAngle(ASPxComboBox comboBox)
            {
                return comboBox.SelectedItem.Text == defaultMarker ? 50 : Int32.Parse(comboBox.SelectedItem.Text);
            }
            public static MarkerKindItem GetSelectedMarkerKindItem(ASPxComboBox comboBox)
            {
                return markerKinds.Find(comboBox.SelectedItem.Text);
            }
            public static double GetSelectedLegendPercent(ASPxComboBox comboBox)
            {
                return double.Parse(DeletePercentMarker(comboBox.SelectedItem.Text));
            }
            public static int GetSelectedLineTension(ASPxComboBox comboBox)
            {
                return Convert.ToInt32(DeletePercentMarker(comboBox.SelectedItem.Text));
            }
            public static int GetSelectedDoughnutHolePercent(ASPxComboBox comboBox)
            {
                string selectedText = comboBox.SelectedItem.Text;
                return
                    selectedText.StartsWith(defaultMarker) ?
                    defaultDoughnutHole :
                    Convert.ToInt32(DeletePercentMarker(selectedText));
            }
            public static int GetSelectedNestedDoughnutHolePercent(ASPxComboBox comboBox)
            {
                return Convert.ToInt32(comboBox.SelectedItem.Text);
            }
            public static int GetSelectedInnerIndent(ASPxComboBox comboBox)
            {
                return Convert.ToInt32(comboBox.SelectedItem.Text);
            }
            public static void ApplySelectedExplodingMode(ASPxComboBox comboBox, PieSeriesViewBase view)
            {
                PieExplodingHelper.ApplyMode(view, comboBox.SelectedItem.Text);
            }
            public static Color GetSelectedRegressionLineColor(ASPxComboBox comboBox)
            {
                return comboBox.SelectedItem.Text == "Default" ? Color.Empty : Color.FromName(comboBox.SelectedItem.Text);
            }
        }

        public static class DataHelper
        {
            static DateTime StringToDateTime(string str)
            {
                return DateTime.Parse(str, CultureInfo.InvariantCulture);
            }
            public static void AddPoint(Series series, string argument, double value)
            {
                DateTime argumentDT = StringToDateTime(argument);
                series.Points.Add(new SeriesPoint(argumentDT, new double[] { value }));
            }
            public static void AddPoint(Series series, string argument, double value1, double value2)
            {
                DateTime argumentDT = StringToDateTime(argument);
                series.Points.Add(new SeriesPoint(argumentDT, new double[] { value1, value2 }));
            }
        }

        public enum Gender
        {
            Male,
            Female
        }

        public static class PopulationAgeProvider
        {
            public static IList<AgePopulation> GetPopulationAgeStructure()
            {
                string[] countries = new string[] { "United States", "Brazil", "Russia", "Japan", "Mexico", "Germany", "United Kingdom" };
                string[] ageCategories = new string[] { "0-14 years", "15-64 years", "65 years and older" };

                Dictionary<Gender, Dictionary<string, double[]>> population = new Dictionary<Gender, Dictionary<string, double[]>>();

                Dictionary<string, double[]> males = new Dictionary<string, double[]>();
                males.Add(ageCategories[0], new double[] { 29.956, 25.607, 13.493, 9.575, 17.306, 6.679, 5.816 });
                males.Add(ageCategories[1], new double[] { 90.354, 55.793, 48.983, 43.363, 30.223, 28.638, 19.622 });
                males.Add(ageCategories[2], new double[] { 14.472, 3.727, 5.802, 9.024, 1.927, 5.133, 3.864 });
                population.Add(Gender.Male, males);
                Dictionary<string, double[]> females = new Dictionary<string, double[]>();
                females.Add(ageCategories[0], new double[] { 28.597, 24.67, 12.971, 9.105, 16.632, 6.333, 5.519 });
                females.Add(ageCategories[1], new double[] { 91.827, 57.598, 52.14, 42.98, 31.868, 27.693, 19.228 });
                females.Add(ageCategories[2], new double[] { 20.362, 5.462, 12.61, 12.501, 2.391, 8.318, 5.459 });
                population.Add(Gender.Female, females);

                List<AgePopulation> result = new List<AgePopulation>();
                foreach (Gender gender in System.Enum.GetValues(typeof(Gender)))
                    foreach (string ageCatregory in ageCategories)
                        for (int i = 0; i < countries.Length; i++)
                            result.Add(new AgePopulation(countries[i], ageCatregory, gender, population[gender][ageCatregory][i]));
                return result;
            }
        }

        public class AgePopulation
        {
            string name;
            string age;
            Gender gender;
            double population;

            public string Name { get { return name; } }
            public string Age { get { return age; } }
            public Gender Gender { get { return gender; } }
            public string GenderAgeKey { get { return gender.ToString() + ": " + age; } }
            public string CountryAgeKey { get { return name + ": " + age; } }
            public string CountryGenderKey { get { return name + ": " + gender.ToString(); } }
            public double Population { get { return population; } }

            public AgePopulation(string name, string age, Gender gender, double population)
            {
                this.name = name;
                this.age = age;
                this.gender = gender;
                this.population = population;
            }
        }

        public static class PieExplodingHelper
        {
            public const string None = "None";
            public const string All = "All";
            public const string MinValue = "Min Value";
            public const string MaxValue = "Max Value";
            public const string Custom = "Custom";
            public static void ApplyMode(PieSeriesViewBase view, string mode)
            {
                switch (mode)
                {
                    case Custom:
                        view.ExplodeMode = PieExplodeMode.UsePoints;
                        break;
                    case None:
                        view.ExplodeMode = PieExplodeMode.None;
                        break;
                    case All:
                        view.ExplodeMode = PieExplodeMode.All;
                        break;
                    case MinValue:
                        view.ExplodeMode = PieExplodeMode.MinValue;
                        break;
                    case MaxValue:
                        view.ExplodeMode = PieExplodeMode.MaxValue;
                        break;
                    default:
                        view.ExplodedPointsFilters.Clear();
                        view.ExplodedPointsFilters.Add(new SeriesPointFilter(SeriesPointKey.Argument, DataFilterCondition.Equal, mode));
                        view.ExplodeMode = PieExplodeMode.UseFilters;
                        break;
                }
            }
            public static string[] GetNames(SeriesPointCollection points, bool supportCustom)
            {
                int itemsCount = points.Count + 4;
                if (supportCustom)
                    itemsCount++;
                string[] items = new string[itemsCount];
                items[0] = None;
                items[1] = All;
                items[2] = MinValue;
                items[3] = MaxValue;
                for (int i = 0; i < points.Count; i++)
                    items[i + 4] = points[i].Argument;
                if (supportCustom)
                    items[points.Count + 4] = Custom;
                return items;
            }
        }

        public static class PolarFunctionCalculator
        {
            static double GetLineFactor(int index)
            {
                switch (index)
                {
                    case 0:
                        return 1;
                    case 1:
                        return 0.5;
                    case 2:
                        return 2;
                    default:
                        return 2;
                }
            }
            static double ToRadian(double angle)
            {
                return angle * Math.PI / 180.0;
            }
            static double Function(double m, double angle)
            {
                double cos = Math.Cos(m * ToRadian(90.0 + angle));
                return Math.Pow(Math.Abs(cos), m);
            }
            public static SeriesPoint[] GenerateFunctionPoints(int index, int pointCount)
            {
                double m = GetLineFactor(index);
                int step = 360 / pointCount;
                SeriesPoint[] points = new SeriesPoint[pointCount];
                for (int i = 0; i < pointCount; i++)
                    points[i] = new SeriesPoint(step * i, new double[] { Function(m, step * i) });
                return points;
            }
            static SeriesPoint[] GenerateScatterFunctionPoints(ScatterFunctionCalculatorBase calculator, int functionIndex)
            {
                return calculator.GenerateScatterFunctionPoints(functionIndex);
            }
            public static SeriesPoint[] GenerateDegreeScatterFunctionPoints(int functionIndex)
            {
                return GenerateScatterFunctionPoints(new DegreesScatterFunctionCalculator(), functionIndex);

            }
            public static SeriesPoint[] GenerateRadianScatterFunctionPoints(int functionIndex)
            {
                return GenerateScatterFunctionPoints(new RadianScatterFunctionCalculator(), functionIndex);
            }
        }

        public abstract class ScatterFunctionCalculatorBase
        {
            const int archimedeanSpiralIndex = 0;
            const int polarRoseIndex = 1;
            const int polarFoliumIndex = 2;
            const int spiralIntervalsCount = 72;
            const int roseIntervalsCount = 288;
            const int foliumSegmentIntervalsCount = 30;

            const double roseParameter = 7.0 / 4.0;
            const double foliumDistanceLimit = 3.0;

            protected abstract double NormalizeAngle(double angle);
            protected abstract double ToRadian(double angle);
            protected abstract double FromDegrees(double angle);

            List<SeriesPoint> FilterPointsByRange(List<SeriesPoint> points, double min, double max)
            {
                List<SeriesPoint> resultPoints = new List<SeriesPoint>();
                foreach (SeriesPoint point in points)
                {
                    double pointValue = point.Values[0];
                    if (pointValue <= max && pointValue >= min)
                        resultPoints.Add(point);
                }
                return resultPoints;
            }
            void CreatePolarFunctionPoints(double minAngleDegree, double maxAngleDegree, int intervalsCount, Func<double, double> function, List<SeriesPoint> points)
            {
                double minAngle = FromDegrees(minAngleDegree);
                double maxAngle = FromDegrees(maxAngleDegree);
                double angleStep = (maxAngle - minAngle) / (double)intervalsCount;
                for (int pointIndex = 0; pointIndex <= intervalsCount; pointIndex++)
                {
                    double angle = minAngle + pointIndex * angleStep;
                    double angleRadians = ToRadian(angle);
                    double distance = function(angleRadians);
                    double normalAngle = NormalizeAngle(angle);
                    points.Add(new SeriesPoint(normalAngle, distance));
                }
            }
            double ArchimedeanSpiralFunction(double angleRadians)
            {
                return angleRadians;
            }
            double PolarRoseFunction(double angleRadians)
            {
                return Math.Max(0.0, Math.Sin(roseParameter * angleRadians));
            }
            double PolarFoliumFunction(double angleRadians)
            {
                double sin = Math.Sin(angleRadians);
                double cos = Math.Cos(angleRadians);
                return (3.0 * sin * cos) / (Math.Pow(sin, 3.0) + Math.Pow(cos, 3.0));
            }

            public SeriesPoint[] GenerateScatterFunctionPoints(int index)
            {
                List<SeriesPoint> points = new List<SeriesPoint>();
                switch (index)
                {
                    case archimedeanSpiralIndex:
                        CreatePolarFunctionPoints(0.0, 720.0, spiralIntervalsCount, ArchimedeanSpiralFunction, points);
                        break;
                    case polarRoseIndex:
                        CreatePolarFunctionPoints(0.0, 1440.0, roseIntervalsCount, PolarRoseFunction, points);
                        break;
                    case polarFoliumIndex:
                        CreatePolarFunctionPoints(120.0, 180.0, foliumSegmentIntervalsCount, PolarFoliumFunction, points);
                        CreatePolarFunctionPoints(0.0, 90.0, foliumSegmentIntervalsCount, PolarFoliumFunction, points);
                        CreatePolarFunctionPoints(270.0, 330.0, foliumSegmentIntervalsCount, PolarFoliumFunction, points);
                        points = FilterPointsByRange(points, 0.0, foliumDistanceLimit);
                        break;
                }
                return points.ToArray();
            }
        }

        public class RadianScatterFunctionCalculator : ScatterFunctionCalculatorBase
        {
            protected override double NormalizeAngle(double angle)
            {
                return angle % (Math.PI * 2.0);
            }
            protected override double ToRadian(double angle)
            {
                return angle;
            }
            protected override double FromDegrees(double angle)
            {
                return angle * Math.PI / 180.0;
            }
        }

        public class DegreesScatterFunctionCalculator : ScatterFunctionCalculatorBase
        {
            protected override double NormalizeAngle(double angle)
            {
                return angle % 360;
            }
            protected override double ToRadian(double angle)
            {
                return angle * Math.PI / 180.0;
            }
            protected override double FromDegrees(double angle)
            {
                return angle;
            }
        }
    }
