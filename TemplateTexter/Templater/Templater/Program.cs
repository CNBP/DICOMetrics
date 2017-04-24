using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Templater
{
    class Program
    {
        static void Main(string[] args)
        {
            List<string> TargetList = new List<string>{
            "Focus_ACMO",
            "Focus_BREN",
            "Focus_CURV",
            "Focus_GDER",
            "Focus_GLVA",
            "Focus_GLLV",
            "Focus_GLVN",
            "Focus_GRAE",
            "Focus_GRAT",
            "Focus_GRAS",
            "Focus_HELM",
            "Focus_HISE",
            "Focus_HISR",
            "Focus_LAPE",
            "Focus_LAPM",
            "Focus_LAPV",
            "Focus_LAPD",
            "Focus_SFIL",
            "Focus_SFRQ",
            "Focus_TENG",
            "Focus_TENV",
            "Focus_VOLA",
            "Focus_WAVS",
            "Focus_WAVV",
            "Focus_WAVR",
            "Noise_AjaNE1",
            "Noise_AjaNE2",
            "Noise_AjaNE3",
            "Noise_AjaNE4",
            "Noise_brummer",
            "Noise_chang",
            "Noise_noise_M1",
            "Noise_noise_M2",
            "Noise_MRI_lmmse",
            "Noise_MeanSignalImage",
            "Noise_MeanSignal50x50",
            "Noise_MeanSignal100x100",
            "Noise_SNR",
            "Noise_SNR50x50",
            "Noise_SNR100x100",
            "Texture_MatEntropy",
            "Texture_GLCMAutocorrelation",
            "Texture_GLCMContrast",
            "Texture_GLCMCorrM",
            "Texture_GLCMCorrP",
            "Texture_GLCMCProm",
            "Texture_GLCM_CShad",
            "Texture_GLCM_Dissi",
            "Texture_GLCM_Energy",
            "Texture_GLCM_Entropy",
            "Texture_GLCM_Homom",
            "Texture_GLCM_HomoP",
            "Texture_GLCM_MaxPR",
            "Texture_GLCM_SOSVH",
            "Texture_GLCM_Savgh",
            "Texture_GLCM_Svarh",
            "Texture_GLCM_Senth",
            "Texture_GLCM_Dvarh",
            "Texture_GLCM_Denth",
            "Texture_Inf1H",
            "Texture_Inf2H",
            "Texture_Indnc",
            "Texture_Idmnc",
            "LiveLab_BIQI",
            "LiveLab_BRISQUE"
            };


            using (System.IO.StreamWriter file =
                new System.IO.StreamWriter(@"D:\Yang\Git\QCMetrics\TemplateTexter\Epic.txt", true))
            {                         
                //foreach (string TargetString in TargetList)
                //{
                //    file.WriteLine("GGRAPH                                                                                           ");
                //    file.Write("  /GRAPHDATASET NAME=\"graphdataset\" VARIABLES=");
                //    file.Write(TargetString);
                //    file.WriteLine(" MISSING=LISTWISE REPORTMISSING=NO       ");
                //    file.WriteLine("  /GRAPHSPEC SOURCE=INLINE.                                                                      ");
                //    file.WriteLine("BEGIN GPL                                                                                        ");
                //    file.WriteLine("  SOURCE: s=userSource(id(\"graphdataset\"))                                                       ");
                //    file.Write("  DATA:");
                //    file.Write(TargetString);
                //    file.Write("=col(source(s), name(\"");
                //    file.Write(TargetString);
                //    file.WriteLine( "\"))");
                //    file.Write("  GUIDE: axis(dim(1), label(\"");
                //    file.Write(TargetString);
                //    file.WriteLine("\"))");
                //    file.WriteLine("  GUIDE: axis(dim(2), label(\"Frequency\"))                                                        ");
                //    file.WriteLine("  ELEMENT: interval(position(summary.count(bin.rect(");
                //    file.Write(TargetString);
                //    file.WriteLine("))), shape.interior(shape.square)) ");
                //    file.WriteLine("END GPL.");
                //    file.WriteLine();
                //}

                foreach (string Target in TargetList)
                {
                    file.WriteLine("GGRAPH                                                                                          ");
                    file.Write("  /GRAPHDATASET NAME=\"graphdataset\" VARIABLES=Sab2 ");
                    file.Write(Target);
                    file.Write(" MISSING=LISTWISE REPORTMISSING=NO ");
                    file.WriteLine("  /GRAPHSPEC SOURCE=INLINE.                                                                     ");
                    file.WriteLine("BEGIN GPL                                                                                       ");
                    file.WriteLine("  SOURCE: s=userSource(id(\"graphdataset\"))                                                      ");
                    file.WriteLine("  DATA: Sab2=col(source(s), name(\"Sab2\"), unit.category())                                      ");
                    file.Write("  DATA:"); 
                    file.Write(Target);
                    file.Write("=col(source(s), name(\"");
                    file.Write(Target);
                    file.WriteLine("\"))");
                    file.WriteLine("  DATA: id=col(source(s), name(\"$CASENUM\"), unit.category())                                    ");
                    file.WriteLine("  GUIDE: axis(dim(1), label(\"Sab2\"))                                                            ");
                    file.Write("  GUIDE: axis(dim(2), label(\"");
                    file.Write(Target);
                    file.Write("\"))");                                                      
                    file.WriteLine("  SCALE: cat(dim(1), include(\"0\", \"1\", \"2\", \"3\"))                                    ");
                    file.WriteLine("  SCALE: linear(dim(2), include(0))                                                             ");
                    file.Write("  ELEMENT: schema(position(bin.quantile.letter(Sab2*");
                    file.Write(Target);
                    file.WriteLine(")), label(id))                    ");
                    file.WriteLine("END GPL.                                                                                        ");
                    file.WriteLine();                                                                                     
                }
            }
            return;
        }
    }

}
