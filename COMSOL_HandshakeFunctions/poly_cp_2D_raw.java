/*
 * poly_cp_2D_raw.java
 */

import com.comsol.model.*;
import com.comsol.model.util.*;

/** Model exported on Jan 4 2022, 11:07 by COMSOL 5.5.0.359. */
public class poly_cp_2D_raw {

  public static Model run() {
    Model model = ModelUtil.create("Model");

    model.modelPath("/u/project/jmarian/cmcelfre/comsol_RX/Simulation Continue Test Space/2D");

    model.label("poly_cp_2D_raw.mph");

    model.comments("untitled\n\n");

    model.param().set("s1_1", "1");
    model.param().set("s1_2", "0");
    model.param().set("s1_3", "0");
    model.param().set("s2_1", "1");
    model.param().set("s2_2", "0");
    model.param().set("s2_3", "0");
    model.param().set("s3_1", "1");
    model.param().set("s3_2", "0");
    model.param().set("s3_3", "0");
    model.param().set("s4_1", "1");
    model.param().set("s4_2", "0");
    model.param().set("s4_3", "0");
    model.param().set("s5_1", "-0.70711");
    model.param().set("s5_2", "-0.70711");
    model.param().set("s5_3", "0");
    model.param().set("s6_1", "-0.70711");
    model.param().set("s6_2", "-0.70711");
    model.param().set("s6_3", "0");
    model.param().set("s7_1", "-0.70711");
    model.param().set("s7_2", "-0.70711");
    model.param().set("s7_3", "0");
    model.param().set("s8_1", "-0.70711");
    model.param().set("s8_2", "-0.70711");
    model.param().set("s8_3", "0");
    model.param().set("s9_1", "0");
    model.param().set("s9_2", "1");
    model.param().set("s9_3", "0");
    model.param().set("s10_1", "0");
    model.param().set("s10_2", "1");
    model.param().set("s10_3", "0");
    model.param().set("s11_1", "0");
    model.param().set("s11_2", "1");
    model.param().set("s11_3", "0");
    model.param().set("s12_1", "0");
    model.param().set("s12_2", "1");
    model.param().set("s12_3", "0");
    model.param().set("s13_1", "0.70711");
    model.param().set("s13_2", "0");
    model.param().set("s13_3", "0.70711");
    model.param().set("s14_1", "0.70711");
    model.param().set("s14_2", "0");
    model.param().set("s14_3", "0.70711");
    model.param().set("s15_1", "0.70711");
    model.param().set("s15_2", "0");
    model.param().set("s15_3", "0.70711");
    model.param().set("s16_1", "0.70711");
    model.param().set("s16_2", "0");
    model.param().set("s16_3", "0.70711");
    model.param().set("s17_1", "0.70711");
    model.param().set("s17_2", "0");
    model.param().set("s17_3", "-0.70711");
    model.param().set("s18_1", "0.70711");
    model.param().set("s18_2", "0");
    model.param().set("s18_3", "-0.70711");
    model.param().set("s19_1", "0.70711");
    model.param().set("s19_2", "0");
    model.param().set("s19_3", "-0.70711");
    model.param().set("s20_1", "0.70711");
    model.param().set("s20_2", "0");
    model.param().set("s20_3", "-0.70711");
    model.param().set("s21_1", "-0.57735");
    model.param().set("s21_2", "-0.57735");
    model.param().set("s21_3", "0.57735");
    model.param().set("s22_1", "-0.57735");
    model.param().set("s22_2", "-0.57735");
    model.param().set("s22_3", "0.57735");
    model.param().set("s23_1", "-0.57735");
    model.param().set("s23_2", "-0.57735");
    model.param().set("s23_3", "0.57735");
    model.param().set("s24_1", "-0.57735");
    model.param().set("s24_2", "-0.57735");
    model.param().set("s24_3", "0.57735");
    model.param().set("s25_1", "-0.57735");
    model.param().set("s25_2", "-0.57735");
    model.param().set("s25_3", "-0.57735");
    model.param().set("s26_1", "-0.57735");
    model.param().set("s26_2", "-0.57735");
    model.param().set("s26_3", "-0.57735");
    model.param().set("s27_1", "-0.57735");
    model.param().set("s27_2", "-0.57735");
    model.param().set("s27_3", "-0.57735");
    model.param().set("s28_1", "-0.57735");
    model.param().set("s28_2", "-0.57735");
    model.param().set("s28_3", "-0.57735");
    model.param().set("s29_1", "0");
    model.param().set("s29_2", "0.70711");
    model.param().set("s29_3", "0.70711");
    model.param().set("s30_1", "0");
    model.param().set("s30_2", "0.70711");
    model.param().set("s30_3", "0.70711");
    model.param().set("s31_1", "0");
    model.param().set("s31_2", "0.70711");
    model.param().set("s31_3", "0.70711");
    model.param().set("s32_1", "0");
    model.param().set("s32_2", "0.70711");
    model.param().set("s32_3", "0.70711");
    model.param().set("s33_1", "0");
    model.param().set("s33_2", "0.70711");
    model.param().set("s33_3", "-0.70711");
    model.param().set("s34_1", "0");
    model.param().set("s34_2", "0.70711");
    model.param().set("s34_3", "-0.70711");
    model.param().set("s35_1", "0");
    model.param().set("s35_2", "0.70711");
    model.param().set("s35_3", "-0.70711");
    model.param().set("s36_1", "0");
    model.param().set("s36_2", "0.70711");
    model.param().set("s36_3", "-0.70711");
    model.param().set("s37_1", "0");
    model.param().set("s37_2", "0");
    model.param().set("s37_3", "1");
    model.param().set("s38_1", "0");
    model.param().set("s38_2", "0");
    model.param().set("s38_3", "1");
    model.param().set("s39_1", "0");
    model.param().set("s39_2", "0");
    model.param().set("s39_3", "1");
    model.param().set("n1_1", "0");
    model.param().set("n1_2", "0");
    model.param().set("n1_3", "1");
    model.param().set("n2_1", "0");
    model.param().set("n2_2", "1");
    model.param().set("n2_3", "0");
    model.param().set("n3_1", "0");
    model.param().set("n3_2", "0.70711");
    model.param().set("n3_3", "0.70711");
    model.param().set("n4_1", "0");
    model.param().set("n4_2", "-0.70711");
    model.param().set("n4_3", "0.70711");
    model.param().set("n5_1", "0");
    model.param().set("n5_2", "0");
    model.param().set("n5_3", "1");
    model.param().set("n6_1", "0.70711");
    model.param().set("n6_2", "-0.70711");
    model.param().set("n6_3", "0");
    model.param().set("n7_1", "0.57735");
    model.param().set("n7_2", "-0.57735");
    model.param().set("n7_3", "0.57735");
    model.param().set("n8_1", "-0.57735");
    model.param().set("n8_2", "0.57735");
    model.param().set("n8_3", "0.57735");
    model.param().set("n9_1", "0");
    model.param().set("n9_2", "0");
    model.param().set("n9_3", "1");
    model.param().set("n10_1", "-1");
    model.param().set("n10_2", "0");
    model.param().set("n10_3", "0");
    model.param().set("n11_1", "-0.70711");
    model.param().set("n11_2", "0");
    model.param().set("n11_3", "0.70711");
    model.param().set("n12_1", "0.70711");
    model.param().set("n12_2", "0");
    model.param().set("n12_3", "0.70711");
    model.param().set("n13_1", "0");
    model.param().set("n13_2", "1");
    model.param().set("n13_3", "0");
    model.param().set("n14_1", "-0.70711");
    model.param().set("n14_2", "0");
    model.param().set("n14_3", "0.70711");
    model.param().set("n15_1", "-0.57735");
    model.param().set("n15_2", "0.57735");
    model.param().set("n15_3", "0.57735");
    model.param().set("n16_1", "-0.66667");
    model.param().set("n16_2", "0.33333");
    model.param().set("n16_3", "0.66667");
    model.param().set("n17_1", "0");
    model.param().set("n17_2", "1");
    model.param().set("n17_3", "0");
    model.param().set("n18_1", "0.70711");
    model.param().set("n18_2", "0");
    model.param().set("n18_3", "0.70711");
    model.param().set("n19_1", "0.57735");
    model.param().set("n19_2", "-0.57735");
    model.param().set("n19_3", "0.57735");
    model.param().set("n20_1", "0.66667");
    model.param().set("n20_2", "-0.33333");
    model.param().set("n20_3", "0.66667");
    model.param().set("n21_1", "0.70711");
    model.param().set("n21_2", "-0.70711");
    model.param().set("n21_3", "0");
    model.param().set("n22_1", "0.70711");
    model.param().set("n22_2", "0");
    model.param().set("n22_3", "0.70711");
    model.param().set("n23_1", "0");
    model.param().set("n23_2", "0.70711");
    model.param().set("n23_3", "0.70711");
    model.param().set("n24_1", "0.40825");
    model.param().set("n24_2", "0.40825");
    model.param().set("n24_3", "0.8165");
    model.param().set("n25_1", "0.70711");
    model.param().set("n25_2", "-0.70711");
    model.param().set("n25_3", "0");
    model.param().set("n26_1", "-0.70711");
    model.param().set("n26_2", "0");
    model.param().set("n26_3", "0.70711");
    model.param().set("n27_1", "0");
    model.param().set("n27_2", "-0.70711");
    model.param().set("n27_3", "0.70711");
    model.param().set("n28_1", "-0.40825");
    model.param().set("n28_2", "-0.40825");
    model.param().set("n28_3", "0.8165");
    model.param().set("n29_1", "-1");
    model.param().set("n29_2", "0");
    model.param().set("n29_3", "0");
    model.param().set("n30_1", "0.57735");
    model.param().set("n30_2", "-0.57735");
    model.param().set("n30_3", "0.57735");
    model.param().set("n31_1", "0");
    model.param().set("n31_2", "-0.70711");
    model.param().set("n31_3", "0.70711");
    model.param().set("n32_1", "0.33333");
    model.param().set("n32_2", "-0.66667");
    model.param().set("n32_3", "0.66667");
    model.param().set("n33_1", "-0.57735");
    model.param().set("n33_2", "0.57735");
    model.param().set("n33_3", "0.57735");
    model.param().set("n34_1", "0");
    model.param().set("n34_2", "0.70711");
    model.param().set("n34_3", "0.70711");
    model.param().set("n35_1", "-0.57735");
    model.param().set("n35_2", "0.57735");
    model.param().set("n35_3", "0.57735");
    model.param().set("n36_1", "-0.33333");
    model.param().set("n36_2", "0.66667");
    model.param().set("n36_3", "0.66667");
    model.param().set("n37_1", "0");
    model.param().set("n37_2", "1");
    model.param().set("n37_3", "0");
    model.param().set("n38_1", "-1");
    model.param().set("n38_2", "0");
    model.param().set("n38_3", "0");
    model.param().set("n39_1", "0.70711");
    model.param().set("n39_2", "-0.70711");
    model.param().set("n39_3", "0");
    model.param().set("c11", "228[GPa]");
    model.param().set("c12", "132[GPa]");
    model.param().set("c44", "116.5[GPa]");
    model.param().set("v0", "3e6[1/s]");
    model.param().set("m", "20");
    model.param().set("b", "2.48e-10[m]");
    model.param().set("hn", "0.125");
    model.param().set("g0", "250[MPa]");
    model.param().set("rho0", "1e12[m^-2]");
    model.param().set("n", "100");
    model.param().set("k1", "450");
    model.param().set("k20", "0.25");
    model.param().set("vk0", "1e10[1/s]");

    model.component().create("comp1", false);

    model.component("comp1").geom().create("geom1", 2);

    model.result().table().create("evl3", "Table");
    model.result().table().create("tbl1", "Table");

    model.func().create("int1", "Interpolation");
    model.func().create("int2", "Interpolation");
    model.func().create("int3", "Interpolation");
    model.func().create("int4", "Interpolation");
    model.func().create("int5", "Interpolation");
    model.func().create("int6", "Interpolation");
    model.func().create("int7", "Interpolation");
    model.func("int1").set("source", "file");
    model.func("int1").set("importedname", "orientation1.txt");
    model.func("int1").set("importedstruct", "Spreadsheet");
    model.func("int1").set("importeddim", "2D");
    model.func("int1").set("funcs", new String[][]{{"qi1", "1"}});
    model.func("int1").set("interp", "neighbor");
    model.func("int1").set("filename", "./COMSOL_input/orientation1.txt");
    model.func("int1").importData();
    model.func("int1").set("nargs", "2");
    model.func("int1").set("struct", "spreadsheet");
    model.func("int2").set("source", "file");
    model.func("int2").set("importedname", "orientation2.txt");
    model.func("int2").set("importedstruct", "Spreadsheet");
    model.func("int2").set("importeddim", "2D");
    model.func("int2").set("funcs", new String[][]{{"qi2", "1"}});
    model.func("int2").set("interp", "neighbor");
    model.func("int2").set("filename", "./COMSOL_input/orientation2.txt");
    model.func("int2").importData();
    model.func("int2").set("nargs", "2");
    model.func("int2").set("struct", "spreadsheet");
    model.func("int3").set("source", "file");
    model.func("int3").set("importedname", "orientation3.txt");
    model.func("int3").set("importedstruct", "Spreadsheet");
    model.func("int3").set("importeddim", "2D");
    model.func("int3").set("funcs", new String[][]{{"qi3", "1"}});
    model.func("int3").set("interp", "neighbor");
    model.func("int3").set("filename", "./COMSOL_input/orientation3.txt");
    model.func("int3").importData();
    model.func("int3").set("nargs", "2");
    model.func("int3").set("struct", "spreadsheet");
    model.func("int4").set("source", "file");
    model.func("int4").set("importedname", "dislocationDensity.txt");
    model.func("int4").set("importedstruct", "Spreadsheet");
    model.func("int4").set("importeddim", "2D");
    model.func("int4").set("funcs", new String[][]{{"h_i", "1"}});
    model.func("int4").set("interp", "neighbor");
    model.func("int4").set("filename", "./COMSOL_input/dislocationDensity.txt");
    model.func("int4").importData();
    model.func("int4").set("nargs", "2");
    model.func("int4").set("struct", "spreadsheet");
    model.func("int5").set("source", "file");
    model.func("int5").set("importedname", "u1.txt");
    model.func("int5").set("importedstruct", "Spreadsheet");
    model.func("int5").set("importeddim", "2D");
    model.func("int5").set("funcs", new String[][]{{"u1_i", "1"}});
    model.func("int5").set("interp", "neighbor");
    model.func("int5").set("filename", "./COMSOL_input/u1.txt");
    model.func("int5").importData();
    model.func("int5").set("nargs", "2");
    model.func("int5").set("struct", "spreadsheet");
    model.func("int6").set("source", "file");
    model.func("int6").set("importedname", "u2.txt");
    model.func("int6").set("importedstruct", "Spreadsheet");
    model.func("int6").set("importeddim", "2D");
    model.func("int6").set("funcs", new String[][]{{"u2_i", "1"}});
    model.func("int6").set("interp", "neighbor");
    model.func("int6").set("filename", "./COMSOL_input/u2.txt");
    model.func("int6").importData();
    model.func("int6").set("nargs", "2");
    model.func("int6").set("struct", "spreadsheet");
    model.func("int7").set("source", "file");
    model.func("int7").active(false);
    model.func("int7").set("importedname", "u2.txt");
    model.func("int7").set("importedstruct", "Spreadsheet");
    model.func("int7").set("importeddim", "2D");
    model.func("int7").set("funcs", new String[][]{{"u3_i", "1"}});
    model.func("int7").set("interp", "neighbor");
    model.func("int7").set("filename", "/COMSOL_input/u2.txt");
    //model.func("int7").importData();

    model.component("comp1").mesh().create("mesh1");

    model.component("comp1").geom("geom1").repairTolType("relative");
    model.component("comp1").geom("geom1").create("sq1", "Square");
    model.component("comp1").geom("geom1").feature("sq1").set("size", "3e-6");
    model.component("comp1").geom("geom1").feature("fin").set("repairtoltype", "relative");
    model.component("comp1").geom("geom1").run();

    model.component("comp1").variable().create("var1");
    model.component("comp1").variable("var1")
         .set("w", "(c44*(Ee12+Ee21)^2)/2+(c44*(Ee13+Ee31)^2)/2+(c44*(Ee23+Ee32)^2)/2+(Ee11^2*c11)/2+(Ee22^2*c11)/2+(Ee33^2*c11)/2+Ee11*Ee22*c12+Ee11*Ee33*c12+Ee22*Ee33*c12", "Elastic energy");
    model.component("comp1").variable("var1")
         .set("W11", "Ee11*c11+Ee22*c12+Ee33*c12", "intermediate stress, component 11");
    model.component("comp1").variable("var1")
         .set("W12", "(c44*(2*Ee12+2*Ee21))/2", "intermediate stress, component 12");
    model.component("comp1").variable("var1")
         .set("W13", "(c44*(2*Ee13+2*Ee31))/2", "intermediate stress, component 13");
    model.component("comp1").variable("var1")
         .set("W21", "(c44*(2*Ee12+2*Ee21))/2", "intermediate stress, component 21");
    model.component("comp1").variable("var1")
         .set("W22", "Ee11*c12+Ee22*c11+Ee33*c12", "intermediate stress, component 22");
    model.component("comp1").variable("var1")
         .set("W23", "(c44*(2*Ee23+2*Ee32))/2", "intermediate stress, component 23");
    model.component("comp1").variable("var1")
         .set("W31", "(c44*(2*Ee13+2*Ee31))/2", "intermediate stress, component 31");
    model.component("comp1").variable("var1")
         .set("W32", "(c44*(2*Ee23+2*Ee32))/2", "intermediate stress, component 32");
    model.component("comp1").variable("var1")
         .set("W33", "Ee11*c12+Ee22*c12+Ee33*c11", "intermediate stress, component 33");
    model.component("comp1").variable("var1")
         .set("Rp11", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "Rp, component 11");
    model.component("comp1").variable("var1")
         .set("Rp12", "(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "Rp, component 12");
    model.component("comp1").variable("var1")
         .set("Rp13", "(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "Rp, component 13");
    model.component("comp1").variable("var1")
         .set("Rp21", "(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "Rp, component 21");
    model.component("comp1").variable("var1")
         .set("Rp22", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "Rp, component 22");
    model.component("comp1").variable("var1")
         .set("Rp23", "(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "Rp, component 23");
    model.component("comp1").variable("var1")
         .set("Rp31", "(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "Rp, component 31");
    model.component("comp1").variable("var1")
         .set("Rp32", "(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "Rp, component 32");
    model.component("comp1").variable("var1")
         .set("Rp33", "1-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "Rp, component 33");
    model.component("comp1").variable("var1")
         .set("Fp11", "Up13*((q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up12*((q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up11*((2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 11");
    model.component("comp1").variable("var1")
         .set("Fp12", "Up23*((q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up22*((q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up12*((2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 12");
    model.component("comp1").variable("var1")
         .set("Fp13", "Up33*((q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up23*((q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up13*((2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 13");
    model.component("comp1").variable("var1")
         .set("Fp21", "Up11*((q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up13*((q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up12*((2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 21");
    model.component("comp1").variable("var1")
         .set("Fp22", "Up12*((q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up23*((q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up22*((2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 22");
    model.component("comp1").variable("var1")
         .set("Fp23", "Up13*((q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up33*((q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up23*((2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 23");
    model.component("comp1").variable("var1")
         .set("Fp31", "Up12*((q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up11*((q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up13*((2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 31");
    model.component("comp1").variable("var1")
         .set("Fp32", "Up22*((q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up12*((q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up23*((2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 32");
    model.component("comp1").variable("var1")
         .set("Fp33", "Up23*((q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up13*((q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)-(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2))-Up33*((2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-1)", "Fp, component 33");
    model.component("comp1").variable("var1")
         .set("da11", "Up11*((4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up12*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up13*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 11");
    model.component("comp1").variable("var1")
         .set("da12", "Up13*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q2^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q2^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up11*((4*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up12*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 12");
    model.component("comp1").variable("var1")
         .set("da13", "Up13*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up11*((4*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up12*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q3^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q3^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 13");
    model.component("comp1").variable("var1")
         .set("da14", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 14");
    model.component("comp1").variable("var1").set("da15", "0", "da, component 15");
    model.component("comp1").variable("var1").set("da16", "0", "da, component 16");
    model.component("comp1").variable("var1")
         .set("da17", "(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 17");
    model.component("comp1").variable("var1")
         .set("da18", "(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 18");
    model.component("comp1").variable("var1").set("da19", "0", "da, component 19");
    model.component("comp1").variable("var1")
         .set("da21", "Up12*((4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up22*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up23*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 21");
    model.component("comp1").variable("var1")
         .set("da22", "Up23*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q2^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q2^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up12*((4*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up22*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 22");
    model.component("comp1").variable("var1")
         .set("da23", "Up23*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up12*((4*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up22*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q3^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q3^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 23");
    model.component("comp1").variable("var1").set("da24", "0", "da, component 24");
    model.component("comp1").variable("var1")
         .set("da25", "(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 25");
    model.component("comp1").variable("var1").set("da26", "0", "da, component 26");
    model.component("comp1").variable("var1")
         .set("da27", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 27");
    model.component("comp1").variable("var1").set("da28", "0", "da, component 28");
    model.component("comp1").variable("var1")
         .set("da29", "(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 29");
    model.component("comp1").variable("var1")
         .set("da31", "Up13*((4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up23*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up33*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 31");
    model.component("comp1").variable("var1")
         .set("da32", "Up33*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q2^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q2^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up13*((4*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up23*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 32");

    return model;
  }

  public static Model run2(Model model) {
    model.component("comp1").variable("var1")
         .set("da33", "Up33*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up13*((4*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up23*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q3^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q3^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 33");
    model.component("comp1").variable("var1").set("da34", "0", "da, component 34");
    model.component("comp1").variable("var1").set("da35", "0", "da, component 35");
    model.component("comp1").variable("var1")
         .set("da36", "(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 36");
    model.component("comp1").variable("var1").set("da37", "0", "da, component 37");
    model.component("comp1").variable("var1")
         .set("da38", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 38");
    model.component("comp1").variable("var1")
         .set("da39", "(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 39");
    model.component("comp1").variable("var1")
         .set("da41", "Up11*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up12*((4*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up13*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q1^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q1^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 41");
    model.component("comp1").variable("var1")
         .set("da42", "Up12*((4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up11*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up13*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 42");
    model.component("comp1").variable("var1")
         .set("da43", "Up11*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q3^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q3^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up12*((4*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up13*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 43");
    model.component("comp1").variable("var1")
         .set("da44", "(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 44");
    model.component("comp1").variable("var1").set("da45", "0", "da, component 45");
    model.component("comp1").variable("var1").set("da46", "0", "da, component 46");
    model.component("comp1").variable("var1")
         .set("da47", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 47");
    model.component("comp1").variable("var1")
         .set("da48", "(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 48");
    model.component("comp1").variable("var1").set("da49", "0", "da, component 49");
    model.component("comp1").variable("var1")
         .set("da51", "Up12*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up22*((4*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up23*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q1^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q1^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 51");
    model.component("comp1").variable("var1")
         .set("da52", "Up22*((4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up12*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up23*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 52");
    model.component("comp1").variable("var1")
         .set("da53", "Up12*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q3^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q3^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up22*((4*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up23*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 53");
    model.component("comp1").variable("var1").set("da54", "0", "da, component 54");
    model.component("comp1").variable("var1")
         .set("da55", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 55");
    model.component("comp1").variable("var1").set("da56", "0", "da, component 56");
    model.component("comp1").variable("var1")
         .set("da57", "(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 57");
    model.component("comp1").variable("var1").set("da58", "0", "da, component 58");
    model.component("comp1").variable("var1")
         .set("da59", "(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 59");
    model.component("comp1").variable("var1")
         .set("da61", "Up13*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up23*((4*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up33*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q1^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q1^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 61");
    model.component("comp1").variable("var1")
         .set("da62", "Up23*((4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up13*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up33*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 62");
    model.component("comp1").variable("var1")
         .set("da63", "Up13*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q3^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q3^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up23*((4*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q3^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up33*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 63");
    model.component("comp1").variable("var1").set("da64", "0", "da, component 64");
    model.component("comp1").variable("var1").set("da65", "0", "da, component 65");
    model.component("comp1").variable("var1")
         .set("da66", "(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 66");
    model.component("comp1").variable("var1").set("da67", "0", "da, component 67");
    model.component("comp1").variable("var1")
         .set("da68", "(q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 68");
    model.component("comp1").variable("var1")
         .set("da69", "1-(2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 69");
    model.component("comp1").variable("var1")
         .set("da71", "Up12*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q1^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q1^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up13*((4*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up11*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 71");
    model.component("comp1").variable("var1")
         .set("da72", "Up12*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up13*((4*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up11*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q2^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q2^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 72");
    model.component("comp1").variable("var1")
         .set("da73", "Up13*((4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up11*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up12*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 73");
    model.component("comp1").variable("var1")
         .set("da74", "(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 74");
    model.component("comp1").variable("var1").set("da75", "0", "da, component 75");
    model.component("comp1").variable("var1").set("da76", "0", "da, component 76");
    model.component("comp1").variable("var1")
         .set("da77", "(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 77");
    model.component("comp1").variable("var1")
         .set("da78", "1-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 78");
    model.component("comp1").variable("var1").set("da79", "0", "da, component 79");
    model.component("comp1").variable("var1")
         .set("da81", "Up22*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q1^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q1^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up23*((4*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up12*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 81");
    model.component("comp1").variable("var1")
         .set("da82", "Up22*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up23*((4*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up12*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q2^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q2^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 82");
    model.component("comp1").variable("var1")
         .set("da83", "Up23*((4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up12*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up22*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 83");
    model.component("comp1").variable("var1").set("da84", "0", "da, component 84");
    model.component("comp1").variable("var1")
         .set("da85", "(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 85");
    model.component("comp1").variable("var1").set("da86", "0", "da, component 86");
    model.component("comp1").variable("var1")
         .set("da87", "(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 87");
    model.component("comp1").variable("var1").set("da88", "0", "da, component 88");
    model.component("comp1").variable("var1")
         .set("da89", "1-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 89");
    model.component("comp1").variable("var1")
         .set("da91", "Up23*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q1^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q1^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up33*((4*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up13*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 91");
    model.component("comp1").variable("var1")
         .set("da92", "Up23*((2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up33*((4*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(4*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(4*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2^3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)+(2*q1^2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))-Up13*(sin((q1^2+q2^2+q3^2)^(1/2))/(q1^2+q2^2+q3^2)^(1/2)-(q2^2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)+(q2^2*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(4*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 92");
    model.component("comp1").variable("var1")
         .set("da93", "Up33*((4*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(4*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2-(2*q1^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2)-(2*q2^2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up13*((2*q1*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)+(q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q1*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))+Up23*((2*q2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)+(q1*q3*cos((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)-(q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(3/2)-(4*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)^2+(2*q2*q3^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)*cos((q1^2+q2^2+q3^2)^(1/2)/2))/(q1^2+q2^2+q3^2)^(3/2))", "da, component 93");
    model.component("comp1").variable("var1").set("da94", "0", "da, component 94");
    model.component("comp1").variable("var1").set("da95", "0", "da, component 95");
    model.component("comp1").variable("var1")
         .set("da96", "1-(2*q2^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(2*q1^2*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 96");
    model.component("comp1").variable("var1").set("da97", "0", "da, component 97");
    model.component("comp1").variable("var1")
         .set("da98", "(2*q1*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)-(q2*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)", "da, component 98");
    model.component("comp1").variable("var1")
         .set("da99", "(q1*sin((q1^2+q2^2+q3^2)^(1/2)))/(q1^2+q2^2+q3^2)^(1/2)+(2*q2*q3*sin((q1^2+q2^2+q3^2)^(1/2)/2)^2)/(q1^2+q2^2+q3^2)", "da, component 99");
    model.component("comp1").variable("var1")
         .set("Jp", "Fp11*Fp22*Fp33-Fp11*Fp23*Fp32-Fp12*Fp21*Fp33+Fp12*Fp23*Fp31+Fp13*Fp21*Fp32-Fp13*Fp22*Fp31", "determinant of Fp");
    model.component("comp1").variable("var1").set("Gp11", "(Fp22*Fp33-Fp23*Fp32)/Jp", "inverse Fp, component 11");
    model.component("comp1").variable("var1").set("Gp21", "(Fp23*Fp31-Fp21*Fp33)/Jp", "inverse Fp, component 21");
    model.component("comp1").variable("var1").set("Gp31", "(Fp21*Fp32-Fp22*Fp31)/Jp", "inverse Fp, component 31");
    model.component("comp1").variable("var1").set("Gp12", "(Fp13*Fp32-Fp12*Fp33)/Jp", "inverse Fp, component 12");
    model.component("comp1").variable("var1").set("Gp22", "(Fp11*Fp33-Fp13*Fp31)/Jp", "inverse Fp, component 22");
    model.component("comp1").variable("var1").set("Gp32", "(Fp12*Fp31-Fp11*Fp32)/Jp", "inverse Fp, component 32");
    model.component("comp1").variable("var1").set("Gp13", "(Fp12*Fp23-Fp13*Fp22)/Jp", "inverse Fp, component 13");
    model.component("comp1").variable("var1").set("Gp23", "(Fp13*Fp21-Fp11*Fp23)/Jp", "inverse Fp, component 23");
    model.component("comp1").variable("var1").set("Gp33", "(Fp11*Fp22-Fp12*Fp21)/Jp", "inverse Fp, component 33");
    model.component("comp1").variable("var1").set("F11", "u1x+1", "deformation gradient, component 11");
    model.component("comp1").variable("var1").set("F12", "u1y+0", "deformation gradient, component 12");
    model.component("comp1").variable("var1").set("F13", "0", "deformation gradient, component 13");
    model.component("comp1").variable("var1").set("F21", "u2x+0", "deformation gradient, component 21");
    model.component("comp1").variable("var1").set("F22", "u2y+1", "deformation gradient, component 22");
    model.component("comp1").variable("var1").set("F23", "0", "deformation gradient, component 23");
    model.component("comp1").variable("var1").set("F31", "0", "deformation gradient, component 31");
    model.component("comp1").variable("var1").set("F32", "0", "deformation gradient, component 32");
    model.component("comp1").variable("var1").set("F33", "1", "deformation gradient, component 33");
    model.component("comp1").variable("var1")
         .set("Fe11", "+F11*Gp11+F12*Gp21+F13*Gp31", "elastic distortion, component 11");
    model.component("comp1").variable("var1")
         .set("Fe12", "+F11*Gp12+F12*Gp22+F13*Gp32", "elastic distortion, component 12");
    model.component("comp1").variable("var1")
         .set("Fe13", "+F11*Gp13+F12*Gp23+F13*Gp33", "elastic distortion, component 13");
    model.component("comp1").variable("var1")
         .set("Fe21", "+F21*Gp11+F22*Gp21+F23*Gp31", "elastic distortion, component 21");
    model.component("comp1").variable("var1")
         .set("Fe22", "+F21*Gp12+F22*Gp22+F23*Gp32", "elastic distortion, component 22");
    model.component("comp1").variable("var1")
         .set("Fe23", "+F21*Gp13+F22*Gp23+F23*Gp33", "elastic distortion, component 23");
    model.component("comp1").variable("var1")
         .set("Fe31", "+F31*Gp11+F32*Gp21+F33*Gp31", "elastic distortion, component 31");
    model.component("comp1").variable("var1")
         .set("Fe32", "+F31*Gp12+F32*Gp22+F33*Gp32", "elastic distortion, component 32");
    model.component("comp1").variable("var1")
         .set("Fe33", "+F31*Gp13+F32*Gp23+F33*Gp33", "elastic distortion, component 33");
    model.component("comp1").variable("var1")
         .set("Ce11", "+Fe11*Fe11+Fe21*Fe21+Fe31*Fe31", "left CG stretch tensor, component 11");
    model.component("comp1").variable("var1")
         .set("Ce12", "+Fe11*Fe12+Fe21*Fe22+Fe31*Fe32", "left CG stretch tensor, component 12");
    model.component("comp1").variable("var1")
         .set("Ce13", "+Fe11*Fe13+Fe21*Fe23+Fe31*Fe33", "left CG stretch tensor, component 13");
    model.component("comp1").variable("var1")
         .set("Ce21", "+Fe12*Fe11+Fe22*Fe21+Fe32*Fe31", "left CG stretch tensor, component 21");
    model.component("comp1").variable("var1")
         .set("Ce22", "+Fe12*Fe12+Fe22*Fe22+Fe32*Fe32", "left CG stretch tensor, component 22");
    model.component("comp1").variable("var1")
         .set("Ce23", "+Fe12*Fe13+Fe22*Fe23+Fe32*Fe33", "left CG stretch tensor, component 23");
    model.component("comp1").variable("var1")
         .set("Ce31", "+Fe13*Fe11+Fe23*Fe21+Fe33*Fe31", "left CG stretch tensor, component 31");
    model.component("comp1").variable("var1")
         .set("Ce32", "+Fe13*Fe12+Fe23*Fe22+Fe33*Fe32", "left CG stretch tensor, component 32");
    model.component("comp1").variable("var1")
         .set("Ce33", "+Fe13*Fe13+Fe23*Fe23+Fe33*Fe33", "left CG stretch tensor, component 33");
    model.component("comp1").variable("var1").set("Ee11", "0.5*Ce11-0.5*1", "elastic strain, component 11");
    model.component("comp1").variable("var1").set("Ee12", "0.5*Ce12-0.5*0", "elastic strain, component 12");
    model.component("comp1").variable("var1").set("Ee13", "0.5*Ce13-0.5*0", "elastic strain, component 13");
    model.component("comp1").variable("var1").set("Ee21", "0.5*Ce21-0.5*0", "elastic strain, component 21");
    model.component("comp1").variable("var1").set("Ee22", "0.5*Ce22-0.5*1", "elastic strain, component 22");
    model.component("comp1").variable("var1").set("Ee23", "0.5*Ce23-0.5*0", "elastic strain, component 23");
    model.component("comp1").variable("var1").set("Ee31", "0.5*Ce31-0.5*0", "elastic strain, component 31");

    return model;
  }

  public static Model run3(Model model) {
    model.component("comp1").variable("var1").set("Ee32", "0.5*Ce32-0.5*0", "elastic strain, component 32");
    model.component("comp1").variable("var1").set("Ee33", "0.5*Ce33-0.5*1", "elastic strain, component 33");
    model.component("comp1").variable("var1")
         .set("P11", "+Fe11*W11*Gp11+Fe11*W12*Gp12+Fe11*W13*Gp13+Fe12*W21*Gp11+Fe12*W22*Gp12+Fe12*W23*Gp13+Fe13*W31*Gp11+Fe13*W32*Gp12+Fe13*W33*Gp13", "first Piola stress, component 11");
    model.component("comp1").variable("var1")
         .set("P12", "+Fe11*W11*Gp21+Fe11*W12*Gp22+Fe11*W13*Gp23+Fe12*W21*Gp21+Fe12*W22*Gp22+Fe12*W23*Gp23+Fe13*W31*Gp21+Fe13*W32*Gp22+Fe13*W33*Gp23", "first Piola stress, component 12");
    model.component("comp1").variable("var1")
         .set("P13", "+Fe11*W11*Gp31+Fe11*W12*Gp32+Fe11*W13*Gp33+Fe12*W21*Gp31+Fe12*W22*Gp32+Fe12*W23*Gp33+Fe13*W31*Gp31+Fe13*W32*Gp32+Fe13*W33*Gp33", "first Piola stress, component 13");
    model.component("comp1").variable("var1")
         .set("P21", "+Fe21*W11*Gp11+Fe21*W12*Gp12+Fe21*W13*Gp13+Fe22*W21*Gp11+Fe22*W22*Gp12+Fe22*W23*Gp13+Fe23*W31*Gp11+Fe23*W32*Gp12+Fe23*W33*Gp13", "first Piola stress, component 21");
    model.component("comp1").variable("var1")
         .set("P22", "+Fe21*W11*Gp21+Fe21*W12*Gp22+Fe21*W13*Gp23+Fe22*W21*Gp21+Fe22*W22*Gp22+Fe22*W23*Gp23+Fe23*W31*Gp21+Fe23*W32*Gp22+Fe23*W33*Gp23", "first Piola stress, component 22");
    model.component("comp1").variable("var1")
         .set("P23", "+Fe21*W11*Gp31+Fe21*W12*Gp32+Fe21*W13*Gp33+Fe22*W21*Gp31+Fe22*W22*Gp32+Fe22*W23*Gp33+Fe23*W31*Gp31+Fe23*W32*Gp32+Fe23*W33*Gp33", "first Piola stress, component 23");
    model.component("comp1").variable("var1")
         .set("P31", "+Fe31*W11*Gp11+Fe31*W12*Gp12+Fe31*W13*Gp13+Fe32*W21*Gp11+Fe32*W22*Gp12+Fe32*W23*Gp13+Fe33*W31*Gp11+Fe33*W32*Gp12+Fe33*W33*Gp13", "first Piola stress, component 31");
    model.component("comp1").variable("var1")
         .set("P32", "+Fe31*W11*Gp21+Fe31*W12*Gp22+Fe31*W13*Gp23+Fe32*W21*Gp21+Fe32*W22*Gp22+Fe32*W23*Gp23+Fe33*W31*Gp21+Fe33*W32*Gp22+Fe33*W33*Gp23", "first Piola stress, component 32");
    model.component("comp1").variable("var1")
         .set("P33", "+Fe31*W11*Gp31+Fe31*W12*Gp32+Fe31*W13*Gp33+Fe32*W21*Gp31+Fe32*W22*Gp32+Fe32*W23*Gp33+Fe33*W31*Gp31+Fe33*W32*Gp32+Fe33*W33*Gp33", "first Piola stress, component 33");
    model.component("comp1").variable("var1")
         .set("rss1", "+W11*n1_1*Ce11*s1_1+W11*n1_1*Ce12*s1_2+W11*n1_1*Ce13*s1_3+W12*n1_2*Ce11*s1_1+W12*n1_2*Ce12*s1_2+W12*n1_2*Ce13*s1_3+W13*n1_3*Ce11*s1_1+W13*n1_3*Ce12*s1_2+W13*n1_3*Ce13*s1_3+W21*n1_1*Ce21*s1_1+W21*n1_1*Ce22*s1_2+W21*n1_1*Ce23*s1_3+W22*n1_2*Ce21*s1_1+W22*n1_2*Ce22*s1_2+W22*n1_2*Ce23*s1_3+W23*n1_3*Ce21*s1_1+W23*n1_3*Ce22*s1_2+W23*n1_3*Ce23*s1_3+W31*n1_1*Ce31*s1_1+W31*n1_1*Ce32*s1_2+W31*n1_1*Ce33*s1_3+W32*n1_2*Ce31*s1_1+W32*n1_2*Ce32*s1_2+W32*n1_2*Ce33*s1_3+W33*n1_3*Ce31*s1_1+W33*n1_3*Ce32*s1_2+W33*n1_3*Ce33*s1_3", "Resolved shear stress 1");
    model.component("comp1").variable("var1")
         .set("rss2", "+W11*n2_1*Ce11*s2_1+W11*n2_1*Ce12*s2_2+W11*n2_1*Ce13*s2_3+W12*n2_2*Ce11*s2_1+W12*n2_2*Ce12*s2_2+W12*n2_2*Ce13*s2_3+W13*n2_3*Ce11*s2_1+W13*n2_3*Ce12*s2_2+W13*n2_3*Ce13*s2_3+W21*n2_1*Ce21*s2_1+W21*n2_1*Ce22*s2_2+W21*n2_1*Ce23*s2_3+W22*n2_2*Ce21*s2_1+W22*n2_2*Ce22*s2_2+W22*n2_2*Ce23*s2_3+W23*n2_3*Ce21*s2_1+W23*n2_3*Ce22*s2_2+W23*n2_3*Ce23*s2_3+W31*n2_1*Ce31*s2_1+W31*n2_1*Ce32*s2_2+W31*n2_1*Ce33*s2_3+W32*n2_2*Ce31*s2_1+W32*n2_2*Ce32*s2_2+W32*n2_2*Ce33*s2_3+W33*n2_3*Ce31*s2_1+W33*n2_3*Ce32*s2_2+W33*n2_3*Ce33*s2_3", "Resolved shear stress 2");
    model.component("comp1").variable("var1")
         .set("rss3", "+W11*n3_1*Ce11*s3_1+W11*n3_1*Ce12*s3_2+W11*n3_1*Ce13*s3_3+W12*n3_2*Ce11*s3_1+W12*n3_2*Ce12*s3_2+W12*n3_2*Ce13*s3_3+W13*n3_3*Ce11*s3_1+W13*n3_3*Ce12*s3_2+W13*n3_3*Ce13*s3_3+W21*n3_1*Ce21*s3_1+W21*n3_1*Ce22*s3_2+W21*n3_1*Ce23*s3_3+W22*n3_2*Ce21*s3_1+W22*n3_2*Ce22*s3_2+W22*n3_2*Ce23*s3_3+W23*n3_3*Ce21*s3_1+W23*n3_3*Ce22*s3_2+W23*n3_3*Ce23*s3_3+W31*n3_1*Ce31*s3_1+W31*n3_1*Ce32*s3_2+W31*n3_1*Ce33*s3_3+W32*n3_2*Ce31*s3_1+W32*n3_2*Ce32*s3_2+W32*n3_2*Ce33*s3_3+W33*n3_3*Ce31*s3_1+W33*n3_3*Ce32*s3_2+W33*n3_3*Ce33*s3_3", "Resolved shear stress 3");
    model.component("comp1").variable("var1")
         .set("rss4", "+W11*n4_1*Ce11*s4_1+W11*n4_1*Ce12*s4_2+W11*n4_1*Ce13*s4_3+W12*n4_2*Ce11*s4_1+W12*n4_2*Ce12*s4_2+W12*n4_2*Ce13*s4_3+W13*n4_3*Ce11*s4_1+W13*n4_3*Ce12*s4_2+W13*n4_3*Ce13*s4_3+W21*n4_1*Ce21*s4_1+W21*n4_1*Ce22*s4_2+W21*n4_1*Ce23*s4_3+W22*n4_2*Ce21*s4_1+W22*n4_2*Ce22*s4_2+W22*n4_2*Ce23*s4_3+W23*n4_3*Ce21*s4_1+W23*n4_3*Ce22*s4_2+W23*n4_3*Ce23*s4_3+W31*n4_1*Ce31*s4_1+W31*n4_1*Ce32*s4_2+W31*n4_1*Ce33*s4_3+W32*n4_2*Ce31*s4_1+W32*n4_2*Ce32*s4_2+W32*n4_2*Ce33*s4_3+W33*n4_3*Ce31*s4_1+W33*n4_3*Ce32*s4_2+W33*n4_3*Ce33*s4_3", "Resolved shear stress 4");
    model.component("comp1").variable("var1")
         .set("rss5", "+W11*n5_1*Ce11*s5_1+W11*n5_1*Ce12*s5_2+W11*n5_1*Ce13*s5_3+W12*n5_2*Ce11*s5_1+W12*n5_2*Ce12*s5_2+W12*n5_2*Ce13*s5_3+W13*n5_3*Ce11*s5_1+W13*n5_3*Ce12*s5_2+W13*n5_3*Ce13*s5_3+W21*n5_1*Ce21*s5_1+W21*n5_1*Ce22*s5_2+W21*n5_1*Ce23*s5_3+W22*n5_2*Ce21*s5_1+W22*n5_2*Ce22*s5_2+W22*n5_2*Ce23*s5_3+W23*n5_3*Ce21*s5_1+W23*n5_3*Ce22*s5_2+W23*n5_3*Ce23*s5_3+W31*n5_1*Ce31*s5_1+W31*n5_1*Ce32*s5_2+W31*n5_1*Ce33*s5_3+W32*n5_2*Ce31*s5_1+W32*n5_2*Ce32*s5_2+W32*n5_2*Ce33*s5_3+W33*n5_3*Ce31*s5_1+W33*n5_3*Ce32*s5_2+W33*n5_3*Ce33*s5_3", "Resolved shear stress 5");
    model.component("comp1").variable("var1")
         .set("rss6", "+W11*n6_1*Ce11*s6_1+W11*n6_1*Ce12*s6_2+W11*n6_1*Ce13*s6_3+W12*n6_2*Ce11*s6_1+W12*n6_2*Ce12*s6_2+W12*n6_2*Ce13*s6_3+W13*n6_3*Ce11*s6_1+W13*n6_3*Ce12*s6_2+W13*n6_3*Ce13*s6_3+W21*n6_1*Ce21*s6_1+W21*n6_1*Ce22*s6_2+W21*n6_1*Ce23*s6_3+W22*n6_2*Ce21*s6_1+W22*n6_2*Ce22*s6_2+W22*n6_2*Ce23*s6_3+W23*n6_3*Ce21*s6_1+W23*n6_3*Ce22*s6_2+W23*n6_3*Ce23*s6_3+W31*n6_1*Ce31*s6_1+W31*n6_1*Ce32*s6_2+W31*n6_1*Ce33*s6_3+W32*n6_2*Ce31*s6_1+W32*n6_2*Ce32*s6_2+W32*n6_2*Ce33*s6_3+W33*n6_3*Ce31*s6_1+W33*n6_3*Ce32*s6_2+W33*n6_3*Ce33*s6_3", "Resolved shear stress 6");
    model.component("comp1").variable("var1")
         .set("rss7", "+W11*n7_1*Ce11*s7_1+W11*n7_1*Ce12*s7_2+W11*n7_1*Ce13*s7_3+W12*n7_2*Ce11*s7_1+W12*n7_2*Ce12*s7_2+W12*n7_2*Ce13*s7_3+W13*n7_3*Ce11*s7_1+W13*n7_3*Ce12*s7_2+W13*n7_3*Ce13*s7_3+W21*n7_1*Ce21*s7_1+W21*n7_1*Ce22*s7_2+W21*n7_1*Ce23*s7_3+W22*n7_2*Ce21*s7_1+W22*n7_2*Ce22*s7_2+W22*n7_2*Ce23*s7_3+W23*n7_3*Ce21*s7_1+W23*n7_3*Ce22*s7_2+W23*n7_3*Ce23*s7_3+W31*n7_1*Ce31*s7_1+W31*n7_1*Ce32*s7_2+W31*n7_1*Ce33*s7_3+W32*n7_2*Ce31*s7_1+W32*n7_2*Ce32*s7_2+W32*n7_2*Ce33*s7_3+W33*n7_3*Ce31*s7_1+W33*n7_3*Ce32*s7_2+W33*n7_3*Ce33*s7_3", "Resolved shear stress 7");
    model.component("comp1").variable("var1")
         .set("rss8", "+W11*n8_1*Ce11*s8_1+W11*n8_1*Ce12*s8_2+W11*n8_1*Ce13*s8_3+W12*n8_2*Ce11*s8_1+W12*n8_2*Ce12*s8_2+W12*n8_2*Ce13*s8_3+W13*n8_3*Ce11*s8_1+W13*n8_3*Ce12*s8_2+W13*n8_3*Ce13*s8_3+W21*n8_1*Ce21*s8_1+W21*n8_1*Ce22*s8_2+W21*n8_1*Ce23*s8_3+W22*n8_2*Ce21*s8_1+W22*n8_2*Ce22*s8_2+W22*n8_2*Ce23*s8_3+W23*n8_3*Ce21*s8_1+W23*n8_3*Ce22*s8_2+W23*n8_3*Ce23*s8_3+W31*n8_1*Ce31*s8_1+W31*n8_1*Ce32*s8_2+W31*n8_1*Ce33*s8_3+W32*n8_2*Ce31*s8_1+W32*n8_2*Ce32*s8_2+W32*n8_2*Ce33*s8_3+W33*n8_3*Ce31*s8_1+W33*n8_3*Ce32*s8_2+W33*n8_3*Ce33*s8_3", "Resolved shear stress 8");
    model.component("comp1").variable("var1")
         .set("rss9", "+W11*n9_1*Ce11*s9_1+W11*n9_1*Ce12*s9_2+W11*n9_1*Ce13*s9_3+W12*n9_2*Ce11*s9_1+W12*n9_2*Ce12*s9_2+W12*n9_2*Ce13*s9_3+W13*n9_3*Ce11*s9_1+W13*n9_3*Ce12*s9_2+W13*n9_3*Ce13*s9_3+W21*n9_1*Ce21*s9_1+W21*n9_1*Ce22*s9_2+W21*n9_1*Ce23*s9_3+W22*n9_2*Ce21*s9_1+W22*n9_2*Ce22*s9_2+W22*n9_2*Ce23*s9_3+W23*n9_3*Ce21*s9_1+W23*n9_3*Ce22*s9_2+W23*n9_3*Ce23*s9_3+W31*n9_1*Ce31*s9_1+W31*n9_1*Ce32*s9_2+W31*n9_1*Ce33*s9_3+W32*n9_2*Ce31*s9_1+W32*n9_2*Ce32*s9_2+W32*n9_2*Ce33*s9_3+W33*n9_3*Ce31*s9_1+W33*n9_3*Ce32*s9_2+W33*n9_3*Ce33*s9_3", "Resolved shear stress 9");
    model.component("comp1").variable("var1")
         .set("rss10", "+W11*n10_1*Ce11*s10_1+W11*n10_1*Ce12*s10_2+W11*n10_1*Ce13*s10_3+W12*n10_2*Ce11*s10_1+W12*n10_2*Ce12*s10_2+W12*n10_2*Ce13*s10_3+W13*n10_3*Ce11*s10_1+W13*n10_3*Ce12*s10_2+W13*n10_3*Ce13*s10_3+W21*n10_1*Ce21*s10_1+W21*n10_1*Ce22*s10_2+W21*n10_1*Ce23*s10_3+W22*n10_2*Ce21*s10_1+W22*n10_2*Ce22*s10_2+W22*n10_2*Ce23*s10_3+W23*n10_3*Ce21*s10_1+W23*n10_3*Ce22*s10_2+W23*n10_3*Ce23*s10_3+W31*n10_1*Ce31*s10_1+W31*n10_1*Ce32*s10_2+W31*n10_1*Ce33*s10_3+W32*n10_2*Ce31*s10_1+W32*n10_2*Ce32*s10_2+W32*n10_2*Ce33*s10_3+W33*n10_3*Ce31*s10_1+W33*n10_3*Ce32*s10_2+W33*n10_3*Ce33*s10_3", "Resolved shear stress 10");
    model.component("comp1").variable("var1")
         .set("rss11", "+W11*n11_1*Ce11*s11_1+W11*n11_1*Ce12*s11_2+W11*n11_1*Ce13*s11_3+W12*n11_2*Ce11*s11_1+W12*n11_2*Ce12*s11_2+W12*n11_2*Ce13*s11_3+W13*n11_3*Ce11*s11_1+W13*n11_3*Ce12*s11_2+W13*n11_3*Ce13*s11_3+W21*n11_1*Ce21*s11_1+W21*n11_1*Ce22*s11_2+W21*n11_1*Ce23*s11_3+W22*n11_2*Ce21*s11_1+W22*n11_2*Ce22*s11_2+W22*n11_2*Ce23*s11_3+W23*n11_3*Ce21*s11_1+W23*n11_3*Ce22*s11_2+W23*n11_3*Ce23*s11_3+W31*n11_1*Ce31*s11_1+W31*n11_1*Ce32*s11_2+W31*n11_1*Ce33*s11_3+W32*n11_2*Ce31*s11_1+W32*n11_2*Ce32*s11_2+W32*n11_2*Ce33*s11_3+W33*n11_3*Ce31*s11_1+W33*n11_3*Ce32*s11_2+W33*n11_3*Ce33*s11_3", "Resolved shear stress 11");
    model.component("comp1").variable("var1")
         .set("rss12", "+W11*n12_1*Ce11*s12_1+W11*n12_1*Ce12*s12_2+W11*n12_1*Ce13*s12_3+W12*n12_2*Ce11*s12_1+W12*n12_2*Ce12*s12_2+W12*n12_2*Ce13*s12_3+W13*n12_3*Ce11*s12_1+W13*n12_3*Ce12*s12_2+W13*n12_3*Ce13*s12_3+W21*n12_1*Ce21*s12_1+W21*n12_1*Ce22*s12_2+W21*n12_1*Ce23*s12_3+W22*n12_2*Ce21*s12_1+W22*n12_2*Ce22*s12_2+W22*n12_2*Ce23*s12_3+W23*n12_3*Ce21*s12_1+W23*n12_3*Ce22*s12_2+W23*n12_3*Ce23*s12_3+W31*n12_1*Ce31*s12_1+W31*n12_1*Ce32*s12_2+W31*n12_1*Ce33*s12_3+W32*n12_2*Ce31*s12_1+W32*n12_2*Ce32*s12_2+W32*n12_2*Ce33*s12_3+W33*n12_3*Ce31*s12_1+W33*n12_3*Ce32*s12_2+W33*n12_3*Ce33*s12_3", "Resolved shear stress 12");
    model.component("comp1").variable("var1")
         .set("rss13", "+W11*n13_1*Ce11*s13_1+W11*n13_1*Ce12*s13_2+W11*n13_1*Ce13*s13_3+W12*n13_2*Ce11*s13_1+W12*n13_2*Ce12*s13_2+W12*n13_2*Ce13*s13_3+W13*n13_3*Ce11*s13_1+W13*n13_3*Ce12*s13_2+W13*n13_3*Ce13*s13_3+W21*n13_1*Ce21*s13_1+W21*n13_1*Ce22*s13_2+W21*n13_1*Ce23*s13_3+W22*n13_2*Ce21*s13_1+W22*n13_2*Ce22*s13_2+W22*n13_2*Ce23*s13_3+W23*n13_3*Ce21*s13_1+W23*n13_3*Ce22*s13_2+W23*n13_3*Ce23*s13_3+W31*n13_1*Ce31*s13_1+W31*n13_1*Ce32*s13_2+W31*n13_1*Ce33*s13_3+W32*n13_2*Ce31*s13_1+W32*n13_2*Ce32*s13_2+W32*n13_2*Ce33*s13_3+W33*n13_3*Ce31*s13_1+W33*n13_3*Ce32*s13_2+W33*n13_3*Ce33*s13_3", "Resolved shear stress 13");
    model.component("comp1").variable("var1")
         .set("rss14", "+W11*n14_1*Ce11*s14_1+W11*n14_1*Ce12*s14_2+W11*n14_1*Ce13*s14_3+W12*n14_2*Ce11*s14_1+W12*n14_2*Ce12*s14_2+W12*n14_2*Ce13*s14_3+W13*n14_3*Ce11*s14_1+W13*n14_3*Ce12*s14_2+W13*n14_3*Ce13*s14_3+W21*n14_1*Ce21*s14_1+W21*n14_1*Ce22*s14_2+W21*n14_1*Ce23*s14_3+W22*n14_2*Ce21*s14_1+W22*n14_2*Ce22*s14_2+W22*n14_2*Ce23*s14_3+W23*n14_3*Ce21*s14_1+W23*n14_3*Ce22*s14_2+W23*n14_3*Ce23*s14_3+W31*n14_1*Ce31*s14_1+W31*n14_1*Ce32*s14_2+W31*n14_1*Ce33*s14_3+W32*n14_2*Ce31*s14_1+W32*n14_2*Ce32*s14_2+W32*n14_2*Ce33*s14_3+W33*n14_3*Ce31*s14_1+W33*n14_3*Ce32*s14_2+W33*n14_3*Ce33*s14_3", "Resolved shear stress 14");
    model.component("comp1").variable("var1")
         .set("rss15", "+W11*n15_1*Ce11*s15_1+W11*n15_1*Ce12*s15_2+W11*n15_1*Ce13*s15_3+W12*n15_2*Ce11*s15_1+W12*n15_2*Ce12*s15_2+W12*n15_2*Ce13*s15_3+W13*n15_3*Ce11*s15_1+W13*n15_3*Ce12*s15_2+W13*n15_3*Ce13*s15_3+W21*n15_1*Ce21*s15_1+W21*n15_1*Ce22*s15_2+W21*n15_1*Ce23*s15_3+W22*n15_2*Ce21*s15_1+W22*n15_2*Ce22*s15_2+W22*n15_2*Ce23*s15_3+W23*n15_3*Ce21*s15_1+W23*n15_3*Ce22*s15_2+W23*n15_3*Ce23*s15_3+W31*n15_1*Ce31*s15_1+W31*n15_1*Ce32*s15_2+W31*n15_1*Ce33*s15_3+W32*n15_2*Ce31*s15_1+W32*n15_2*Ce32*s15_2+W32*n15_2*Ce33*s15_3+W33*n15_3*Ce31*s15_1+W33*n15_3*Ce32*s15_2+W33*n15_3*Ce33*s15_3", "Resolved shear stress 15");
    model.component("comp1").variable("var1")
         .set("rss16", "+W11*n16_1*Ce11*s16_1+W11*n16_1*Ce12*s16_2+W11*n16_1*Ce13*s16_3+W12*n16_2*Ce11*s16_1+W12*n16_2*Ce12*s16_2+W12*n16_2*Ce13*s16_3+W13*n16_3*Ce11*s16_1+W13*n16_3*Ce12*s16_2+W13*n16_3*Ce13*s16_3+W21*n16_1*Ce21*s16_1+W21*n16_1*Ce22*s16_2+W21*n16_1*Ce23*s16_3+W22*n16_2*Ce21*s16_1+W22*n16_2*Ce22*s16_2+W22*n16_2*Ce23*s16_3+W23*n16_3*Ce21*s16_1+W23*n16_3*Ce22*s16_2+W23*n16_3*Ce23*s16_3+W31*n16_1*Ce31*s16_1+W31*n16_1*Ce32*s16_2+W31*n16_1*Ce33*s16_3+W32*n16_2*Ce31*s16_1+W32*n16_2*Ce32*s16_2+W32*n16_2*Ce33*s16_3+W33*n16_3*Ce31*s16_1+W33*n16_3*Ce32*s16_2+W33*n16_3*Ce33*s16_3", "Resolved shear stress 16");
    model.component("comp1").variable("var1")
         .set("rss17", "+W11*n17_1*Ce11*s17_1+W11*n17_1*Ce12*s17_2+W11*n17_1*Ce13*s17_3+W12*n17_2*Ce11*s17_1+W12*n17_2*Ce12*s17_2+W12*n17_2*Ce13*s17_3+W13*n17_3*Ce11*s17_1+W13*n17_3*Ce12*s17_2+W13*n17_3*Ce13*s17_3+W21*n17_1*Ce21*s17_1+W21*n17_1*Ce22*s17_2+W21*n17_1*Ce23*s17_3+W22*n17_2*Ce21*s17_1+W22*n17_2*Ce22*s17_2+W22*n17_2*Ce23*s17_3+W23*n17_3*Ce21*s17_1+W23*n17_3*Ce22*s17_2+W23*n17_3*Ce23*s17_3+W31*n17_1*Ce31*s17_1+W31*n17_1*Ce32*s17_2+W31*n17_1*Ce33*s17_3+W32*n17_2*Ce31*s17_1+W32*n17_2*Ce32*s17_2+W32*n17_2*Ce33*s17_3+W33*n17_3*Ce31*s17_1+W33*n17_3*Ce32*s17_2+W33*n17_3*Ce33*s17_3", "Resolved shear stress 17");
    model.component("comp1").variable("var1")
         .set("rss18", "+W11*n18_1*Ce11*s18_1+W11*n18_1*Ce12*s18_2+W11*n18_1*Ce13*s18_3+W12*n18_2*Ce11*s18_1+W12*n18_2*Ce12*s18_2+W12*n18_2*Ce13*s18_3+W13*n18_3*Ce11*s18_1+W13*n18_3*Ce12*s18_2+W13*n18_3*Ce13*s18_3+W21*n18_1*Ce21*s18_1+W21*n18_1*Ce22*s18_2+W21*n18_1*Ce23*s18_3+W22*n18_2*Ce21*s18_1+W22*n18_2*Ce22*s18_2+W22*n18_2*Ce23*s18_3+W23*n18_3*Ce21*s18_1+W23*n18_3*Ce22*s18_2+W23*n18_3*Ce23*s18_3+W31*n18_1*Ce31*s18_1+W31*n18_1*Ce32*s18_2+W31*n18_1*Ce33*s18_3+W32*n18_2*Ce31*s18_1+W32*n18_2*Ce32*s18_2+W32*n18_2*Ce33*s18_3+W33*n18_3*Ce31*s18_1+W33*n18_3*Ce32*s18_2+W33*n18_3*Ce33*s18_3", "Resolved shear stress 18");
    model.component("comp1").variable("var1")
         .set("rss19", "+W11*n19_1*Ce11*s19_1+W11*n19_1*Ce12*s19_2+W11*n19_1*Ce13*s19_3+W12*n19_2*Ce11*s19_1+W12*n19_2*Ce12*s19_2+W12*n19_2*Ce13*s19_3+W13*n19_3*Ce11*s19_1+W13*n19_3*Ce12*s19_2+W13*n19_3*Ce13*s19_3+W21*n19_1*Ce21*s19_1+W21*n19_1*Ce22*s19_2+W21*n19_1*Ce23*s19_3+W22*n19_2*Ce21*s19_1+W22*n19_2*Ce22*s19_2+W22*n19_2*Ce23*s19_3+W23*n19_3*Ce21*s19_1+W23*n19_3*Ce22*s19_2+W23*n19_3*Ce23*s19_3+W31*n19_1*Ce31*s19_1+W31*n19_1*Ce32*s19_2+W31*n19_1*Ce33*s19_3+W32*n19_2*Ce31*s19_1+W32*n19_2*Ce32*s19_2+W32*n19_2*Ce33*s19_3+W33*n19_3*Ce31*s19_1+W33*n19_3*Ce32*s19_2+W33*n19_3*Ce33*s19_3", "Resolved shear stress 19");
    model.component("comp1").variable("var1")
         .set("rss20", "+W11*n20_1*Ce11*s20_1+W11*n20_1*Ce12*s20_2+W11*n20_1*Ce13*s20_3+W12*n20_2*Ce11*s20_1+W12*n20_2*Ce12*s20_2+W12*n20_2*Ce13*s20_3+W13*n20_3*Ce11*s20_1+W13*n20_3*Ce12*s20_2+W13*n20_3*Ce13*s20_3+W21*n20_1*Ce21*s20_1+W21*n20_1*Ce22*s20_2+W21*n20_1*Ce23*s20_3+W22*n20_2*Ce21*s20_1+W22*n20_2*Ce22*s20_2+W22*n20_2*Ce23*s20_3+W23*n20_3*Ce21*s20_1+W23*n20_3*Ce22*s20_2+W23*n20_3*Ce23*s20_3+W31*n20_1*Ce31*s20_1+W31*n20_1*Ce32*s20_2+W31*n20_1*Ce33*s20_3+W32*n20_2*Ce31*s20_1+W32*n20_2*Ce32*s20_2+W32*n20_2*Ce33*s20_3+W33*n20_3*Ce31*s20_1+W33*n20_3*Ce32*s20_2+W33*n20_3*Ce33*s20_3", "Resolved shear stress 20");
    model.component("comp1").variable("var1")
         .set("rss21", "+W11*n21_1*Ce11*s21_1+W11*n21_1*Ce12*s21_2+W11*n21_1*Ce13*s21_3+W12*n21_2*Ce11*s21_1+W12*n21_2*Ce12*s21_2+W12*n21_2*Ce13*s21_3+W13*n21_3*Ce11*s21_1+W13*n21_3*Ce12*s21_2+W13*n21_3*Ce13*s21_3+W21*n21_1*Ce21*s21_1+W21*n21_1*Ce22*s21_2+W21*n21_1*Ce23*s21_3+W22*n21_2*Ce21*s21_1+W22*n21_2*Ce22*s21_2+W22*n21_2*Ce23*s21_3+W23*n21_3*Ce21*s21_1+W23*n21_3*Ce22*s21_2+W23*n21_3*Ce23*s21_3+W31*n21_1*Ce31*s21_1+W31*n21_1*Ce32*s21_2+W31*n21_1*Ce33*s21_3+W32*n21_2*Ce31*s21_1+W32*n21_2*Ce32*s21_2+W32*n21_2*Ce33*s21_3+W33*n21_3*Ce31*s21_1+W33*n21_3*Ce32*s21_2+W33*n21_3*Ce33*s21_3", "Resolved shear stress 21");
    model.component("comp1").variable("var1")
         .set("rss22", "+W11*n22_1*Ce11*s22_1+W11*n22_1*Ce12*s22_2+W11*n22_1*Ce13*s22_3+W12*n22_2*Ce11*s22_1+W12*n22_2*Ce12*s22_2+W12*n22_2*Ce13*s22_3+W13*n22_3*Ce11*s22_1+W13*n22_3*Ce12*s22_2+W13*n22_3*Ce13*s22_3+W21*n22_1*Ce21*s22_1+W21*n22_1*Ce22*s22_2+W21*n22_1*Ce23*s22_3+W22*n22_2*Ce21*s22_1+W22*n22_2*Ce22*s22_2+W22*n22_2*Ce23*s22_3+W23*n22_3*Ce21*s22_1+W23*n22_3*Ce22*s22_2+W23*n22_3*Ce23*s22_3+W31*n22_1*Ce31*s22_1+W31*n22_1*Ce32*s22_2+W31*n22_1*Ce33*s22_3+W32*n22_2*Ce31*s22_1+W32*n22_2*Ce32*s22_2+W32*n22_2*Ce33*s22_3+W33*n22_3*Ce31*s22_1+W33*n22_3*Ce32*s22_2+W33*n22_3*Ce33*s22_3", "Resolved shear stress 22");
    model.component("comp1").variable("var1")
         .set("rss23", "+W11*n23_1*Ce11*s23_1+W11*n23_1*Ce12*s23_2+W11*n23_1*Ce13*s23_3+W12*n23_2*Ce11*s23_1+W12*n23_2*Ce12*s23_2+W12*n23_2*Ce13*s23_3+W13*n23_3*Ce11*s23_1+W13*n23_3*Ce12*s23_2+W13*n23_3*Ce13*s23_3+W21*n23_1*Ce21*s23_1+W21*n23_1*Ce22*s23_2+W21*n23_1*Ce23*s23_3+W22*n23_2*Ce21*s23_1+W22*n23_2*Ce22*s23_2+W22*n23_2*Ce23*s23_3+W23*n23_3*Ce21*s23_1+W23*n23_3*Ce22*s23_2+W23*n23_3*Ce23*s23_3+W31*n23_1*Ce31*s23_1+W31*n23_1*Ce32*s23_2+W31*n23_1*Ce33*s23_3+W32*n23_2*Ce31*s23_1+W32*n23_2*Ce32*s23_2+W32*n23_2*Ce33*s23_3+W33*n23_3*Ce31*s23_1+W33*n23_3*Ce32*s23_2+W33*n23_3*Ce33*s23_3", "Resolved shear stress 23");
    model.component("comp1").variable("var1")
         .set("rss24", "+W11*n24_1*Ce11*s24_1+W11*n24_1*Ce12*s24_2+W11*n24_1*Ce13*s24_3+W12*n24_2*Ce11*s24_1+W12*n24_2*Ce12*s24_2+W12*n24_2*Ce13*s24_3+W13*n24_3*Ce11*s24_1+W13*n24_3*Ce12*s24_2+W13*n24_3*Ce13*s24_3+W21*n24_1*Ce21*s24_1+W21*n24_1*Ce22*s24_2+W21*n24_1*Ce23*s24_3+W22*n24_2*Ce21*s24_1+W22*n24_2*Ce22*s24_2+W22*n24_2*Ce23*s24_3+W23*n24_3*Ce21*s24_1+W23*n24_3*Ce22*s24_2+W23*n24_3*Ce23*s24_3+W31*n24_1*Ce31*s24_1+W31*n24_1*Ce32*s24_2+W31*n24_1*Ce33*s24_3+W32*n24_2*Ce31*s24_1+W32*n24_2*Ce32*s24_2+W32*n24_2*Ce33*s24_3+W33*n24_3*Ce31*s24_1+W33*n24_3*Ce32*s24_2+W33*n24_3*Ce33*s24_3", "Resolved shear stress 24");
    model.component("comp1").variable("var1")
         .set("rss25", "+W11*n25_1*Ce11*s25_1+W11*n25_1*Ce12*s25_2+W11*n25_1*Ce13*s25_3+W12*n25_2*Ce11*s25_1+W12*n25_2*Ce12*s25_2+W12*n25_2*Ce13*s25_3+W13*n25_3*Ce11*s25_1+W13*n25_3*Ce12*s25_2+W13*n25_3*Ce13*s25_3+W21*n25_1*Ce21*s25_1+W21*n25_1*Ce22*s25_2+W21*n25_1*Ce23*s25_3+W22*n25_2*Ce21*s25_1+W22*n25_2*Ce22*s25_2+W22*n25_2*Ce23*s25_3+W23*n25_3*Ce21*s25_1+W23*n25_3*Ce22*s25_2+W23*n25_3*Ce23*s25_3+W31*n25_1*Ce31*s25_1+W31*n25_1*Ce32*s25_2+W31*n25_1*Ce33*s25_3+W32*n25_2*Ce31*s25_1+W32*n25_2*Ce32*s25_2+W32*n25_2*Ce33*s25_3+W33*n25_3*Ce31*s25_1+W33*n25_3*Ce32*s25_2+W33*n25_3*Ce33*s25_3", "Resolved shear stress 25");
    model.component("comp1").variable("var1")
         .set("rss26", "+W11*n26_1*Ce11*s26_1+W11*n26_1*Ce12*s26_2+W11*n26_1*Ce13*s26_3+W12*n26_2*Ce11*s26_1+W12*n26_2*Ce12*s26_2+W12*n26_2*Ce13*s26_3+W13*n26_3*Ce11*s26_1+W13*n26_3*Ce12*s26_2+W13*n26_3*Ce13*s26_3+W21*n26_1*Ce21*s26_1+W21*n26_1*Ce22*s26_2+W21*n26_1*Ce23*s26_3+W22*n26_2*Ce21*s26_1+W22*n26_2*Ce22*s26_2+W22*n26_2*Ce23*s26_3+W23*n26_3*Ce21*s26_1+W23*n26_3*Ce22*s26_2+W23*n26_3*Ce23*s26_3+W31*n26_1*Ce31*s26_1+W31*n26_1*Ce32*s26_2+W31*n26_1*Ce33*s26_3+W32*n26_2*Ce31*s26_1+W32*n26_2*Ce32*s26_2+W32*n26_2*Ce33*s26_3+W33*n26_3*Ce31*s26_1+W33*n26_3*Ce32*s26_2+W33*n26_3*Ce33*s26_3", "Resolved shear stress 26");
    model.component("comp1").variable("var1")
         .set("rss27", "+W11*n27_1*Ce11*s27_1+W11*n27_1*Ce12*s27_2+W11*n27_1*Ce13*s27_3+W12*n27_2*Ce11*s27_1+W12*n27_2*Ce12*s27_2+W12*n27_2*Ce13*s27_3+W13*n27_3*Ce11*s27_1+W13*n27_3*Ce12*s27_2+W13*n27_3*Ce13*s27_3+W21*n27_1*Ce21*s27_1+W21*n27_1*Ce22*s27_2+W21*n27_1*Ce23*s27_3+W22*n27_2*Ce21*s27_1+W22*n27_2*Ce22*s27_2+W22*n27_2*Ce23*s27_3+W23*n27_3*Ce21*s27_1+W23*n27_3*Ce22*s27_2+W23*n27_3*Ce23*s27_3+W31*n27_1*Ce31*s27_1+W31*n27_1*Ce32*s27_2+W31*n27_1*Ce33*s27_3+W32*n27_2*Ce31*s27_1+W32*n27_2*Ce32*s27_2+W32*n27_2*Ce33*s27_3+W33*n27_3*Ce31*s27_1+W33*n27_3*Ce32*s27_2+W33*n27_3*Ce33*s27_3", "Resolved shear stress 27");
    model.component("comp1").variable("var1")
         .set("rss28", "+W11*n28_1*Ce11*s28_1+W11*n28_1*Ce12*s28_2+W11*n28_1*Ce13*s28_3+W12*n28_2*Ce11*s28_1+W12*n28_2*Ce12*s28_2+W12*n28_2*Ce13*s28_3+W13*n28_3*Ce11*s28_1+W13*n28_3*Ce12*s28_2+W13*n28_3*Ce13*s28_3+W21*n28_1*Ce21*s28_1+W21*n28_1*Ce22*s28_2+W21*n28_1*Ce23*s28_3+W22*n28_2*Ce21*s28_1+W22*n28_2*Ce22*s28_2+W22*n28_2*Ce23*s28_3+W23*n28_3*Ce21*s28_1+W23*n28_3*Ce22*s28_2+W23*n28_3*Ce23*s28_3+W31*n28_1*Ce31*s28_1+W31*n28_1*Ce32*s28_2+W31*n28_1*Ce33*s28_3+W32*n28_2*Ce31*s28_1+W32*n28_2*Ce32*s28_2+W32*n28_2*Ce33*s28_3+W33*n28_3*Ce31*s28_1+W33*n28_3*Ce32*s28_2+W33*n28_3*Ce33*s28_3", "Resolved shear stress 28");
    model.component("comp1").variable("var1")
         .set("rss29", "+W11*n29_1*Ce11*s29_1+W11*n29_1*Ce12*s29_2+W11*n29_1*Ce13*s29_3+W12*n29_2*Ce11*s29_1+W12*n29_2*Ce12*s29_2+W12*n29_2*Ce13*s29_3+W13*n29_3*Ce11*s29_1+W13*n29_3*Ce12*s29_2+W13*n29_3*Ce13*s29_3+W21*n29_1*Ce21*s29_1+W21*n29_1*Ce22*s29_2+W21*n29_1*Ce23*s29_3+W22*n29_2*Ce21*s29_1+W22*n29_2*Ce22*s29_2+W22*n29_2*Ce23*s29_3+W23*n29_3*Ce21*s29_1+W23*n29_3*Ce22*s29_2+W23*n29_3*Ce23*s29_3+W31*n29_1*Ce31*s29_1+W31*n29_1*Ce32*s29_2+W31*n29_1*Ce33*s29_3+W32*n29_2*Ce31*s29_1+W32*n29_2*Ce32*s29_2+W32*n29_2*Ce33*s29_3+W33*n29_3*Ce31*s29_1+W33*n29_3*Ce32*s29_2+W33*n29_3*Ce33*s29_3", "Resolved shear stress 29");
    model.component("comp1").variable("var1")
         .set("rss30", "+W11*n30_1*Ce11*s30_1+W11*n30_1*Ce12*s30_2+W11*n30_1*Ce13*s30_3+W12*n30_2*Ce11*s30_1+W12*n30_2*Ce12*s30_2+W12*n30_2*Ce13*s30_3+W13*n30_3*Ce11*s30_1+W13*n30_3*Ce12*s30_2+W13*n30_3*Ce13*s30_3+W21*n30_1*Ce21*s30_1+W21*n30_1*Ce22*s30_2+W21*n30_1*Ce23*s30_3+W22*n30_2*Ce21*s30_1+W22*n30_2*Ce22*s30_2+W22*n30_2*Ce23*s30_3+W23*n30_3*Ce21*s30_1+W23*n30_3*Ce22*s30_2+W23*n30_3*Ce23*s30_3+W31*n30_1*Ce31*s30_1+W31*n30_1*Ce32*s30_2+W31*n30_1*Ce33*s30_3+W32*n30_2*Ce31*s30_1+W32*n30_2*Ce32*s30_2+W32*n30_2*Ce33*s30_3+W33*n30_3*Ce31*s30_1+W33*n30_3*Ce32*s30_2+W33*n30_3*Ce33*s30_3", "Resolved shear stress 30");
    model.component("comp1").variable("var1")
         .set("rss31", "+W11*n31_1*Ce11*s31_1+W11*n31_1*Ce12*s31_2+W11*n31_1*Ce13*s31_3+W12*n31_2*Ce11*s31_1+W12*n31_2*Ce12*s31_2+W12*n31_2*Ce13*s31_3+W13*n31_3*Ce11*s31_1+W13*n31_3*Ce12*s31_2+W13*n31_3*Ce13*s31_3+W21*n31_1*Ce21*s31_1+W21*n31_1*Ce22*s31_2+W21*n31_1*Ce23*s31_3+W22*n31_2*Ce21*s31_1+W22*n31_2*Ce22*s31_2+W22*n31_2*Ce23*s31_3+W23*n31_3*Ce21*s31_1+W23*n31_3*Ce22*s31_2+W23*n31_3*Ce23*s31_3+W31*n31_1*Ce31*s31_1+W31*n31_1*Ce32*s31_2+W31*n31_1*Ce33*s31_3+W32*n31_2*Ce31*s31_1+W32*n31_2*Ce32*s31_2+W32*n31_2*Ce33*s31_3+W33*n31_3*Ce31*s31_1+W33*n31_3*Ce32*s31_2+W33*n31_3*Ce33*s31_3", "Resolved shear stress 31");
    model.component("comp1").variable("var1")
         .set("rss32", "+W11*n32_1*Ce11*s32_1+W11*n32_1*Ce12*s32_2+W11*n32_1*Ce13*s32_3+W12*n32_2*Ce11*s32_1+W12*n32_2*Ce12*s32_2+W12*n32_2*Ce13*s32_3+W13*n32_3*Ce11*s32_1+W13*n32_3*Ce12*s32_2+W13*n32_3*Ce13*s32_3+W21*n32_1*Ce21*s32_1+W21*n32_1*Ce22*s32_2+W21*n32_1*Ce23*s32_3+W22*n32_2*Ce21*s32_1+W22*n32_2*Ce22*s32_2+W22*n32_2*Ce23*s32_3+W23*n32_3*Ce21*s32_1+W23*n32_3*Ce22*s32_2+W23*n32_3*Ce23*s32_3+W31*n32_1*Ce31*s32_1+W31*n32_1*Ce32*s32_2+W31*n32_1*Ce33*s32_3+W32*n32_2*Ce31*s32_1+W32*n32_2*Ce32*s32_2+W32*n32_2*Ce33*s32_3+W33*n32_3*Ce31*s32_1+W33*n32_3*Ce32*s32_2+W33*n32_3*Ce33*s32_3", "Resolved shear stress 32");
    model.component("comp1").variable("var1")
         .set("rss33", "+W11*n33_1*Ce11*s33_1+W11*n33_1*Ce12*s33_2+W11*n33_1*Ce13*s33_3+W12*n33_2*Ce11*s33_1+W12*n33_2*Ce12*s33_2+W12*n33_2*Ce13*s33_3+W13*n33_3*Ce11*s33_1+W13*n33_3*Ce12*s33_2+W13*n33_3*Ce13*s33_3+W21*n33_1*Ce21*s33_1+W21*n33_1*Ce22*s33_2+W21*n33_1*Ce23*s33_3+W22*n33_2*Ce21*s33_1+W22*n33_2*Ce22*s33_2+W22*n33_2*Ce23*s33_3+W23*n33_3*Ce21*s33_1+W23*n33_3*Ce22*s33_2+W23*n33_3*Ce23*s33_3+W31*n33_1*Ce31*s33_1+W31*n33_1*Ce32*s33_2+W31*n33_1*Ce33*s33_3+W32*n33_2*Ce31*s33_1+W32*n33_2*Ce32*s33_2+W32*n33_2*Ce33*s33_3+W33*n33_3*Ce31*s33_1+W33*n33_3*Ce32*s33_2+W33*n33_3*Ce33*s33_3", "Resolved shear stress 33");
    model.component("comp1").variable("var1")
         .set("rss34", "+W11*n34_1*Ce11*s34_1+W11*n34_1*Ce12*s34_2+W11*n34_1*Ce13*s34_3+W12*n34_2*Ce11*s34_1+W12*n34_2*Ce12*s34_2+W12*n34_2*Ce13*s34_3+W13*n34_3*Ce11*s34_1+W13*n34_3*Ce12*s34_2+W13*n34_3*Ce13*s34_3+W21*n34_1*Ce21*s34_1+W21*n34_1*Ce22*s34_2+W21*n34_1*Ce23*s34_3+W22*n34_2*Ce21*s34_1+W22*n34_2*Ce22*s34_2+W22*n34_2*Ce23*s34_3+W23*n34_3*Ce21*s34_1+W23*n34_3*Ce22*s34_2+W23*n34_3*Ce23*s34_3+W31*n34_1*Ce31*s34_1+W31*n34_1*Ce32*s34_2+W31*n34_1*Ce33*s34_3+W32*n34_2*Ce31*s34_1+W32*n34_2*Ce32*s34_2+W32*n34_2*Ce33*s34_3+W33*n34_3*Ce31*s34_1+W33*n34_3*Ce32*s34_2+W33*n34_3*Ce33*s34_3", "Resolved shear stress 34");
    model.component("comp1").variable("var1")
         .set("rss35", "+W11*n35_1*Ce11*s35_1+W11*n35_1*Ce12*s35_2+W11*n35_1*Ce13*s35_3+W12*n35_2*Ce11*s35_1+W12*n35_2*Ce12*s35_2+W12*n35_2*Ce13*s35_3+W13*n35_3*Ce11*s35_1+W13*n35_3*Ce12*s35_2+W13*n35_3*Ce13*s35_3+W21*n35_1*Ce21*s35_1+W21*n35_1*Ce22*s35_2+W21*n35_1*Ce23*s35_3+W22*n35_2*Ce21*s35_1+W22*n35_2*Ce22*s35_2+W22*n35_2*Ce23*s35_3+W23*n35_3*Ce21*s35_1+W23*n35_3*Ce22*s35_2+W23*n35_3*Ce23*s35_3+W31*n35_1*Ce31*s35_1+W31*n35_1*Ce32*s35_2+W31*n35_1*Ce33*s35_3+W32*n35_2*Ce31*s35_1+W32*n35_2*Ce32*s35_2+W32*n35_2*Ce33*s35_3+W33*n35_3*Ce31*s35_1+W33*n35_3*Ce32*s35_2+W33*n35_3*Ce33*s35_3", "Resolved shear stress 35");
    model.component("comp1").variable("var1")
         .set("rss36", "+W11*n36_1*Ce11*s36_1+W11*n36_1*Ce12*s36_2+W11*n36_1*Ce13*s36_3+W12*n36_2*Ce11*s36_1+W12*n36_2*Ce12*s36_2+W12*n36_2*Ce13*s36_3+W13*n36_3*Ce11*s36_1+W13*n36_3*Ce12*s36_2+W13*n36_3*Ce13*s36_3+W21*n36_1*Ce21*s36_1+W21*n36_1*Ce22*s36_2+W21*n36_1*Ce23*s36_3+W22*n36_2*Ce21*s36_1+W22*n36_2*Ce22*s36_2+W22*n36_2*Ce23*s36_3+W23*n36_3*Ce21*s36_1+W23*n36_3*Ce22*s36_2+W23*n36_3*Ce23*s36_3+W31*n36_1*Ce31*s36_1+W31*n36_1*Ce32*s36_2+W31*n36_1*Ce33*s36_3+W32*n36_2*Ce31*s36_1+W32*n36_2*Ce32*s36_2+W32*n36_2*Ce33*s36_3+W33*n36_3*Ce31*s36_1+W33*n36_3*Ce32*s36_2+W33*n36_3*Ce33*s36_3", "Resolved shear stress 36");
    model.component("comp1").variable("var1")
         .set("rss37", "+W11*n37_1*Ce11*s37_1+W11*n37_1*Ce12*s37_2+W11*n37_1*Ce13*s37_3+W12*n37_2*Ce11*s37_1+W12*n37_2*Ce12*s37_2+W12*n37_2*Ce13*s37_3+W13*n37_3*Ce11*s37_1+W13*n37_3*Ce12*s37_2+W13*n37_3*Ce13*s37_3+W21*n37_1*Ce21*s37_1+W21*n37_1*Ce22*s37_2+W21*n37_1*Ce23*s37_3+W22*n37_2*Ce21*s37_1+W22*n37_2*Ce22*s37_2+W22*n37_2*Ce23*s37_3+W23*n37_3*Ce21*s37_1+W23*n37_3*Ce22*s37_2+W23*n37_3*Ce23*s37_3+W31*n37_1*Ce31*s37_1+W31*n37_1*Ce32*s37_2+W31*n37_1*Ce33*s37_3+W32*n37_2*Ce31*s37_1+W32*n37_2*Ce32*s37_2+W32*n37_2*Ce33*s37_3+W33*n37_3*Ce31*s37_1+W33*n37_3*Ce32*s37_2+W33*n37_3*Ce33*s37_3", "Resolved shear stress 37");
    model.component("comp1").variable("var1")
         .set("rss38", "+W11*n38_1*Ce11*s38_1+W11*n38_1*Ce12*s38_2+W11*n38_1*Ce13*s38_3+W12*n38_2*Ce11*s38_1+W12*n38_2*Ce12*s38_2+W12*n38_2*Ce13*s38_3+W13*n38_3*Ce11*s38_1+W13*n38_3*Ce12*s38_2+W13*n38_3*Ce13*s38_3+W21*n38_1*Ce21*s38_1+W21*n38_1*Ce22*s38_2+W21*n38_1*Ce23*s38_3+W22*n38_2*Ce21*s38_1+W22*n38_2*Ce22*s38_2+W22*n38_2*Ce23*s38_3+W23*n38_3*Ce21*s38_1+W23*n38_3*Ce22*s38_2+W23*n38_3*Ce23*s38_3+W31*n38_1*Ce31*s38_1+W31*n38_1*Ce32*s38_2+W31*n38_1*Ce33*s38_3+W32*n38_2*Ce31*s38_1+W32*n38_2*Ce32*s38_2+W32*n38_2*Ce33*s38_3+W33*n38_3*Ce31*s38_1+W33*n38_3*Ce32*s38_2+W33*n38_3*Ce33*s38_3", "Resolved shear stress 38");
    model.component("comp1").variable("var1")
         .set("rss39", "+W11*n39_1*Ce11*s39_1+W11*n39_1*Ce12*s39_2+W11*n39_1*Ce13*s39_3+W12*n39_2*Ce11*s39_1+W12*n39_2*Ce12*s39_2+W12*n39_2*Ce13*s39_3+W13*n39_3*Ce11*s39_1+W13*n39_3*Ce12*s39_2+W13*n39_3*Ce13*s39_3+W21*n39_1*Ce21*s39_1+W21*n39_1*Ce22*s39_2+W21*n39_1*Ce23*s39_3+W22*n39_2*Ce21*s39_1+W22*n39_2*Ce22*s39_2+W22*n39_2*Ce23*s39_3+W23*n39_3*Ce21*s39_1+W23*n39_3*Ce22*s39_2+W23*n39_3*Ce23*s39_3+W31*n39_1*Ce31*s39_1+W31*n39_1*Ce32*s39_2+W31*n39_1*Ce33*s39_3+W32*n39_2*Ce31*s39_1+W32*n39_2*Ce32*s39_2+W32*n39_2*Ce33*s39_3+W33*n39_3*Ce31*s39_1+W33*n39_3*Ce32*s39_2+W33*n39_3*Ce33*s39_3", "Resolved shear stress 39");
    model.component("comp1").variable("var1").set("v1", "sign(rss1)*v0*(abs(rss1)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v2", "sign(rss2)*v0*(abs(rss2)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v3", "sign(rss3)*v0*(abs(rss3)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v4", "sign(rss4)*v0*(abs(rss4)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v5", "sign(rss5)*v0*(abs(rss5)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v6", "sign(rss6)*v0*(abs(rss6)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v7", "sign(rss7)*v0*(abs(rss7)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v8", "sign(rss8)*v0*(abs(rss8)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v9", "sign(rss9)*v0*(abs(rss9)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v10", "sign(rss10)*v0*(abs(rss10)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v11", "sign(rss11)*v0*(abs(rss11)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v12", "sign(rss12)*v0*(abs(rss12)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v13", "sign(rss13)*v0*(abs(rss13)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v14", "sign(rss14)*v0*(abs(rss14)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v15", "sign(rss15)*v0*(abs(rss15)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v16", "sign(rss16)*v0*(abs(rss16)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v17", "sign(rss17)*v0*(abs(rss17)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v18", "sign(rss18)*v0*(abs(rss18)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v19", "sign(rss19)*v0*(abs(rss19)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v20", "sign(rss20)*v0*(abs(rss20)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v21", "sign(rss21)*v0*(abs(rss21)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v22", "sign(rss22)*v0*(abs(rss22)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v23", "sign(rss23)*v0*(abs(rss23)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v24", "sign(rss24)*v0*(abs(rss24)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v25", "sign(rss25)*v0*(abs(rss25)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v26", "sign(rss26)*v0*(abs(rss26)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v27", "sign(rss27)*v0*(abs(rss27)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v28", "sign(rss28)*v0*(abs(rss28)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v29", "sign(rss29)*v0*(abs(rss29)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v30", "sign(rss30)*v0*(abs(rss30)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v31", "sign(rss31)*v0*(abs(rss31)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v32", "sign(rss32)*v0*(abs(rss32)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v33", "sign(rss33)*v0*(abs(rss33)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v34", "sign(rss34)*v0*(abs(rss34)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v35", "sign(rss35)*v0*(abs(rss35)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v36", "sign(rss36)*v0*(abs(rss36)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v37", "sign(rss37)*v0*(abs(rss37)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v38", "sign(rss38)*v0*(abs(rss38)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("v39", "sign(rss39)*v0*(abs(rss39)/g)^m", "slip rate");
    model.component("comp1").variable("var1").set("g", "g0+b*c44*sqrt(hn*rhon)", "yield stress");
    model.component("comp1").variable("var1").set("rhon", "rho0*h", "dislocation density");
    model.component("comp1").variable("var1")
         .set("v", "1e-10[1/s]+abs(v1)+abs(v2)+abs(v3)+abs(v4)+abs(v5)+abs(v6)+abs(v7)+abs(v8)+abs(v9)+abs(v10)+abs(v11)+abs(v12)+abs(v13)+abs(v14)+abs(v15)+abs(v16)+abs(v17)+abs(v18)+abs(v19)+abs(v20)+abs(v21)+abs(v22)+abs(v23)+abs(v24)+abs(v25)+abs(v26)+abs(v27)+abs(v28)+abs(v29)+abs(v30)+abs(v31)+abs(v32)+abs(v33)+abs(v34)+abs(v35)+abs(v36)+abs(v37)+abs(v38)+abs(v39)", "total slip rate");

    return model;
  }

  public static Model run4(Model model) {
    model.component("comp1").variable("var1")
         .set("doth", "v*k1*sqrt(h)-k2*h", "rate of change in dislocation density");
    model.component("comp1").variable("var1").set("k2", "k20*vk0^(1/n)*v^((n-1)/n)", "dislocation annihilation");
    model.component("comp1").variable("var1")
         .set("Lp11", "+v1*s1_1*n1_1+v2*s2_1*n2_1+v3*s3_1*n3_1+v4*s4_1*n4_1+v5*s5_1*n5_1+v6*s6_1*n6_1+v7*s7_1*n7_1+v8*s8_1*n8_1+v9*s9_1*n9_1+v10*s10_1*n10_1+v11*s11_1*n11_1+v12*s12_1*n12_1+v13*s13_1*n13_1+v14*s14_1*n14_1+v15*s15_1*n15_1+v16*s16_1*n16_1+v17*s17_1*n17_1+v18*s18_1*n18_1+v19*s19_1*n19_1+v20*s20_1*n20_1+v21*s21_1*n21_1+v22*s22_1*n22_1+v23*s23_1*n23_1+v24*s24_1*n24_1+v25*s25_1*n25_1+v26*s26_1*n26_1+v27*s27_1*n27_1+v28*s28_1*n28_1+v29*s29_1*n29_1+v30*s30_1*n30_1+v31*s31_1*n31_1+v32*s32_1*n32_1+v33*s33_1*n33_1+v34*s34_1*n34_1+v35*s35_1*n35_1+v36*s36_1*n36_1+v37*s37_1*n37_1+v38*s38_1*n38_1+v39*s39_1*n39_1", "Lp, component 11");
    model.component("comp1").variable("var1")
         .set("Lp12", "+v1*s1_1*n1_2+v2*s2_1*n2_2+v3*s3_1*n3_2+v4*s4_1*n4_2+v5*s5_1*n5_2+v6*s6_1*n6_2+v7*s7_1*n7_2+v8*s8_1*n8_2+v9*s9_1*n9_2+v10*s10_1*n10_2+v11*s11_1*n11_2+v12*s12_1*n12_2+v13*s13_1*n13_2+v14*s14_1*n14_2+v15*s15_1*n15_2+v16*s16_1*n16_2+v17*s17_1*n17_2+v18*s18_1*n18_2+v19*s19_1*n19_2+v20*s20_1*n20_2+v21*s21_1*n21_2+v22*s22_1*n22_2+v23*s23_1*n23_2+v24*s24_1*n24_2+v25*s25_1*n25_2+v26*s26_1*n26_2+v27*s27_1*n27_2+v28*s28_1*n28_2+v29*s29_1*n29_2+v30*s30_1*n30_2+v31*s31_1*n31_2+v32*s32_1*n32_2+v33*s33_1*n33_2+v34*s34_1*n34_2+v35*s35_1*n35_2+v36*s36_1*n36_2+v37*s37_1*n37_2+v38*s38_1*n38_2+v39*s39_1*n39_2", "Lp, component 12");
    model.component("comp1").variable("var1")
         .set("Lp13", "+v1*s1_1*n1_3+v2*s2_1*n2_3+v3*s3_1*n3_3+v4*s4_1*n4_3+v5*s5_1*n5_3+v6*s6_1*n6_3+v7*s7_1*n7_3+v8*s8_1*n8_3+v9*s9_1*n9_3+v10*s10_1*n10_3+v11*s11_1*n11_3+v12*s12_1*n12_3+v13*s13_1*n13_3+v14*s14_1*n14_3+v15*s15_1*n15_3+v16*s16_1*n16_3+v17*s17_1*n17_3+v18*s18_1*n18_3+v19*s19_1*n19_3+v20*s20_1*n20_3+v21*s21_1*n21_3+v22*s22_1*n22_3+v23*s23_1*n23_3+v24*s24_1*n24_3+v25*s25_1*n25_3+v26*s26_1*n26_3+v27*s27_1*n27_3+v28*s28_1*n28_3+v29*s29_1*n29_3+v30*s30_1*n30_3+v31*s31_1*n31_3+v32*s32_1*n32_3+v33*s33_1*n33_3+v34*s34_1*n34_3+v35*s35_1*n35_3+v36*s36_1*n36_3+v37*s37_1*n37_3+v38*s38_1*n38_3+v39*s39_1*n39_3", "Lp, component 13");
    model.component("comp1").variable("var1")
         .set("Lp21", "+v1*s1_2*n1_1+v2*s2_2*n2_1+v3*s3_2*n3_1+v4*s4_2*n4_1+v5*s5_2*n5_1+v6*s6_2*n6_1+v7*s7_2*n7_1+v8*s8_2*n8_1+v9*s9_2*n9_1+v10*s10_2*n10_1+v11*s11_2*n11_1+v12*s12_2*n12_1+v13*s13_2*n13_1+v14*s14_2*n14_1+v15*s15_2*n15_1+v16*s16_2*n16_1+v17*s17_2*n17_1+v18*s18_2*n18_1+v19*s19_2*n19_1+v20*s20_2*n20_1+v21*s21_2*n21_1+v22*s22_2*n22_1+v23*s23_2*n23_1+v24*s24_2*n24_1+v25*s25_2*n25_1+v26*s26_2*n26_1+v27*s27_2*n27_1+v28*s28_2*n28_1+v29*s29_2*n29_1+v30*s30_2*n30_1+v31*s31_2*n31_1+v32*s32_2*n32_1+v33*s33_2*n33_1+v34*s34_2*n34_1+v35*s35_2*n35_1+v36*s36_2*n36_1+v37*s37_2*n37_1+v38*s38_2*n38_1+v39*s39_2*n39_1", "Lp, component 21");
    model.component("comp1").variable("var1")
         .set("Lp22", "+v1*s1_2*n1_2+v2*s2_2*n2_2+v3*s3_2*n3_2+v4*s4_2*n4_2+v5*s5_2*n5_2+v6*s6_2*n6_2+v7*s7_2*n7_2+v8*s8_2*n8_2+v9*s9_2*n9_2+v10*s10_2*n10_2+v11*s11_2*n11_2+v12*s12_2*n12_2+v13*s13_2*n13_2+v14*s14_2*n14_2+v15*s15_2*n15_2+v16*s16_2*n16_2+v17*s17_2*n17_2+v18*s18_2*n18_2+v19*s19_2*n19_2+v20*s20_2*n20_2+v21*s21_2*n21_2+v22*s22_2*n22_2+v23*s23_2*n23_2+v24*s24_2*n24_2+v25*s25_2*n25_2+v26*s26_2*n26_2+v27*s27_2*n27_2+v28*s28_2*n28_2+v29*s29_2*n29_2+v30*s30_2*n30_2+v31*s31_2*n31_2+v32*s32_2*n32_2+v33*s33_2*n33_2+v34*s34_2*n34_2+v35*s35_2*n35_2+v36*s36_2*n36_2+v37*s37_2*n37_2+v38*s38_2*n38_2+v39*s39_2*n39_2", "Lp, component 22");
    model.component("comp1").variable("var1")
         .set("Lp23", "+v1*s1_2*n1_3+v2*s2_2*n2_3+v3*s3_2*n3_3+v4*s4_2*n4_3+v5*s5_2*n5_3+v6*s6_2*n6_3+v7*s7_2*n7_3+v8*s8_2*n8_3+v9*s9_2*n9_3+v10*s10_2*n10_3+v11*s11_2*n11_3+v12*s12_2*n12_3+v13*s13_2*n13_3+v14*s14_2*n14_3+v15*s15_2*n15_3+v16*s16_2*n16_3+v17*s17_2*n17_3+v18*s18_2*n18_3+v19*s19_2*n19_3+v20*s20_2*n20_3+v21*s21_2*n21_3+v22*s22_2*n22_3+v23*s23_2*n23_3+v24*s24_2*n24_3+v25*s25_2*n25_3+v26*s26_2*n26_3+v27*s27_2*n27_3+v28*s28_2*n28_3+v29*s29_2*n29_3+v30*s30_2*n30_3+v31*s31_2*n31_3+v32*s32_2*n32_3+v33*s33_2*n33_3+v34*s34_2*n34_3+v35*s35_2*n35_3+v36*s36_2*n36_3+v37*s37_2*n37_3+v38*s38_2*n38_3+v39*s39_2*n39_3", "Lp, component 23");
    model.component("comp1").variable("var1")
         .set("Lp31", "+v1*s1_3*n1_1+v2*s2_3*n2_1+v3*s3_3*n3_1+v4*s4_3*n4_1+v5*s5_3*n5_1+v6*s6_3*n6_1+v7*s7_3*n7_1+v8*s8_3*n8_1+v9*s9_3*n9_1+v10*s10_3*n10_1+v11*s11_3*n11_1+v12*s12_3*n12_1+v13*s13_3*n13_1+v14*s14_3*n14_1+v15*s15_3*n15_1+v16*s16_3*n16_1+v17*s17_3*n17_1+v18*s18_3*n18_1+v19*s19_3*n19_1+v20*s20_3*n20_1+v21*s21_3*n21_1+v22*s22_3*n22_1+v23*s23_3*n23_1+v24*s24_3*n24_1+v25*s25_3*n25_1+v26*s26_3*n26_1+v27*s27_3*n27_1+v28*s28_3*n28_1+v29*s29_3*n29_1+v30*s30_3*n30_1+v31*s31_3*n31_1+v32*s32_3*n32_1+v33*s33_3*n33_1+v34*s34_3*n34_1+v35*s35_3*n35_1+v36*s36_3*n36_1+v37*s37_3*n37_1+v38*s38_3*n38_1+v39*s39_3*n39_1", "Lp, component 31");
    model.component("comp1").variable("var1")
         .set("Lp32", "+v1*s1_3*n1_2+v2*s2_3*n2_2+v3*s3_3*n3_2+v4*s4_3*n4_2+v5*s5_3*n5_2+v6*s6_3*n6_2+v7*s7_3*n7_2+v8*s8_3*n8_2+v9*s9_3*n9_2+v10*s10_3*n10_2+v11*s11_3*n11_2+v12*s12_3*n12_2+v13*s13_3*n13_2+v14*s14_3*n14_2+v15*s15_3*n15_2+v16*s16_3*n16_2+v17*s17_3*n17_2+v18*s18_3*n18_2+v19*s19_3*n19_2+v20*s20_3*n20_2+v21*s21_3*n21_2+v22*s22_3*n22_2+v23*s23_3*n23_2+v24*s24_3*n24_2+v25*s25_3*n25_2+v26*s26_3*n26_2+v27*s27_3*n27_2+v28*s28_3*n28_2+v29*s29_3*n29_2+v30*s30_3*n30_2+v31*s31_3*n31_2+v32*s32_3*n32_2+v33*s33_3*n33_2+v34*s34_3*n34_2+v35*s35_3*n35_2+v36*s36_3*n36_2+v37*s37_3*n37_2+v38*s38_3*n38_2+v39*s39_3*n39_2", "Lp, component 32");
    model.component("comp1").variable("var1")
         .set("Lp33", "+v1*s1_3*n1_3+v2*s2_3*n2_3+v3*s3_3*n3_3+v4*s4_3*n4_3+v5*s5_3*n5_3+v6*s6_3*n6_3+v7*s7_3*n7_3+v8*s8_3*n8_3+v9*s9_3*n9_3+v10*s10_3*n10_3+v11*s11_3*n11_3+v12*s12_3*n12_3+v13*s13_3*n13_3+v14*s14_3*n14_3+v15*s15_3*n15_3+v16*s16_3*n16_3+v17*s17_3*n17_3+v18*s18_3*n18_3+v19*s19_3*n19_3+v20*s20_3*n20_3+v21*s21_3*n21_3+v22*s22_3*n22_3+v23*s23_3*n23_3+v24*s24_3*n24_3+v25*s25_3*n25_3+v26*s26_3*n26_3+v27*s27_3*n27_3+v28*s28_3*n28_3+v29*s29_3*n29_3+v30*s30_3*n30_3+v31*s31_3*n31_3+v32*s32_3*n32_3+v33*s33_3*n33_3+v34*s34_3*n34_3+v35*s35_3*n35_3+v36*s36_3*n36_3+v37*s37_3*n37_3+v38*s38_3*n38_3+v39*s39_3*n39_3", "Lp, component 33");
    model.component("comp1").variable("var1").set("LpFp11", "+Lp11*Fp11+Lp12*Fp21+Lp13*Fp31", "LpFp, component 11");
    model.component("comp1").variable("var1").set("LpFp12", "+Lp11*Fp12+Lp12*Fp22+Lp13*Fp32", "LpFp, component 12");
    model.component("comp1").variable("var1").set("LpFp13", "+Lp11*Fp13+Lp12*Fp23+Lp13*Fp33", "LpFp, component 13");
    model.component("comp1").variable("var1").set("LpFp21", "+Lp21*Fp11+Lp22*Fp21+Lp23*Fp31", "LpFp, component 21");
    model.component("comp1").variable("var1").set("LpFp22", "+Lp21*Fp12+Lp22*Fp22+Lp23*Fp32", "LpFp, component 22");
    model.component("comp1").variable("var1").set("LpFp23", "+Lp21*Fp13+Lp22*Fp23+Lp23*Fp33", "LpFp, component 23");
    model.component("comp1").variable("var1").set("LpFp31", "+Lp31*Fp11+Lp32*Fp21+Lp33*Fp31", "LpFp, component 31");
    model.component("comp1").variable("var1").set("LpFp32", "+Lp31*Fp12+Lp32*Fp22+Lp33*Fp32", "LpFp, component 32");
    model.component("comp1").variable("var1").set("LpFp33", "+Lp31*Fp13+Lp32*Fp23+Lp33*Fp33", "LpFp, component 33");
    model.component("comp1").variable("var1")
         .set("G11", "(+0*d(Fp11,x)*Fp11+0*d(Fp12,x)*Fp11+0*d(Fp13,x)*Fp11+0*d(Fp11,y)*Fp11+0*d(Fp12,y)*Fp11+1*d(Fp13,y)*Fp11+0*d(Fp11,x)*Fp12+0*d(Fp12,x)*Fp12+-1*d(Fp13,x)*Fp12+0*d(Fp11,y)*Fp12+0*d(Fp12,y)*Fp12+0*d(Fp13,y)*Fp12+0*d(Fp11,x)*Fp13+1*d(Fp12,x)*Fp13+0*d(Fp13,x)*Fp13+-1*d(Fp11,y)*Fp13+0*d(Fp12,y)*Fp13+0*d(Fp13,y)*Fp13)/Jp", "G, component 11");
    model.component("comp1").variable("var1")
         .set("G12", "(+0*d(Fp21,x)*Fp11+0*d(Fp22,x)*Fp11+0*d(Fp23,x)*Fp11+0*d(Fp21,y)*Fp11+0*d(Fp22,y)*Fp11+1*d(Fp23,y)*Fp11+0*d(Fp21,x)*Fp12+0*d(Fp22,x)*Fp12+-1*d(Fp23,x)*Fp12+0*d(Fp21,y)*Fp12+0*d(Fp22,y)*Fp12+0*d(Fp23,y)*Fp12+0*d(Fp21,x)*Fp13+1*d(Fp22,x)*Fp13+0*d(Fp23,x)*Fp13+-1*d(Fp21,y)*Fp13+0*d(Fp22,y)*Fp13+0*d(Fp23,y)*Fp13)/Jp", "G, component 12");
    model.component("comp1").variable("var1")
         .set("G13", "(+0*d(Fp31,x)*Fp11+0*d(Fp32,x)*Fp11+0*d(Fp33,x)*Fp11+0*d(Fp31,y)*Fp11+0*d(Fp32,y)*Fp11+1*d(Fp33,y)*Fp11+0*d(Fp31,x)*Fp12+0*d(Fp32,x)*Fp12+-1*d(Fp33,x)*Fp12+0*d(Fp31,y)*Fp12+0*d(Fp32,y)*Fp12+0*d(Fp33,y)*Fp12+0*d(Fp31,x)*Fp13+1*d(Fp32,x)*Fp13+0*d(Fp33,x)*Fp13+-1*d(Fp31,y)*Fp13+0*d(Fp32,y)*Fp13+0*d(Fp33,y)*Fp13)/Jp", "G, component 13");
    model.component("comp1").variable("var1")
         .set("G21", "(+0*d(Fp11,x)*Fp21+0*d(Fp12,x)*Fp21+0*d(Fp13,x)*Fp21+0*d(Fp11,y)*Fp21+0*d(Fp12,y)*Fp21+1*d(Fp13,y)*Fp21+0*d(Fp11,x)*Fp22+0*d(Fp12,x)*Fp22+-1*d(Fp13,x)*Fp22+0*d(Fp11,y)*Fp22+0*d(Fp12,y)*Fp22+0*d(Fp13,y)*Fp22+0*d(Fp11,x)*Fp23+1*d(Fp12,x)*Fp23+0*d(Fp13,x)*Fp23+-1*d(Fp11,y)*Fp23+0*d(Fp12,y)*Fp23+0*d(Fp13,y)*Fp23)/Jp", "G, component 21");
    model.component("comp1").variable("var1")
         .set("G22", "(+0*d(Fp21,x)*Fp21+0*d(Fp22,x)*Fp21+0*d(Fp23,x)*Fp21+0*d(Fp21,y)*Fp21+0*d(Fp22,y)*Fp21+1*d(Fp23,y)*Fp21+0*d(Fp21,x)*Fp22+0*d(Fp22,x)*Fp22+-1*d(Fp23,x)*Fp22+0*d(Fp21,y)*Fp22+0*d(Fp22,y)*Fp22+0*d(Fp23,y)*Fp22+0*d(Fp21,x)*Fp23+1*d(Fp22,x)*Fp23+0*d(Fp23,x)*Fp23+-1*d(Fp21,y)*Fp23+0*d(Fp22,y)*Fp23+0*d(Fp23,y)*Fp23)/Jp", "G, component 22");
    model.component("comp1").variable("var1")
         .set("G23", "(+0*d(Fp31,x)*Fp21+0*d(Fp32,x)*Fp21+0*d(Fp33,x)*Fp21+0*d(Fp31,y)*Fp21+0*d(Fp32,y)*Fp21+1*d(Fp33,y)*Fp21+0*d(Fp31,x)*Fp22+0*d(Fp32,x)*Fp22+-1*d(Fp33,x)*Fp22+0*d(Fp31,y)*Fp22+0*d(Fp32,y)*Fp22+0*d(Fp33,y)*Fp22+0*d(Fp31,x)*Fp23+1*d(Fp32,x)*Fp23+0*d(Fp33,x)*Fp23+-1*d(Fp31,y)*Fp23+0*d(Fp32,y)*Fp23+0*d(Fp33,y)*Fp23)/Jp", "G, component 23");
    model.component("comp1").variable("var1")
         .set("G31", "(+0*d(Fp11,x)*Fp31+0*d(Fp12,x)*Fp31+0*d(Fp13,x)*Fp31+0*d(Fp11,y)*Fp31+0*d(Fp12,y)*Fp31+1*d(Fp13,y)*Fp31+0*d(Fp11,x)*Fp32+0*d(Fp12,x)*Fp32+-1*d(Fp13,x)*Fp32+0*d(Fp11,y)*Fp32+0*d(Fp12,y)*Fp32+0*d(Fp13,y)*Fp32+0*d(Fp11,x)*Fp33+1*d(Fp12,x)*Fp33+0*d(Fp13,x)*Fp33+-1*d(Fp11,y)*Fp33+0*d(Fp12,y)*Fp33+0*d(Fp13,y)*Fp33)/Jp", "G, component 31");
    model.component("comp1").variable("var1")
         .set("G32", "(+0*d(Fp21,x)*Fp31+0*d(Fp22,x)*Fp31+0*d(Fp23,x)*Fp31+0*d(Fp21,y)*Fp31+0*d(Fp22,y)*Fp31+1*d(Fp23,y)*Fp31+0*d(Fp21,x)*Fp32+0*d(Fp22,x)*Fp32+-1*d(Fp23,x)*Fp32+0*d(Fp21,y)*Fp32+0*d(Fp22,y)*Fp32+0*d(Fp23,y)*Fp32+0*d(Fp21,x)*Fp33+1*d(Fp22,x)*Fp33+0*d(Fp23,x)*Fp33+-1*d(Fp21,y)*Fp33+0*d(Fp22,y)*Fp33+0*d(Fp23,y)*Fp33)/Jp", "G, component 32");
    model.component("comp1").variable("var1")
         .set("G33", "(+0*d(Fp31,x)*Fp31+0*d(Fp32,x)*Fp31+0*d(Fp33,x)*Fp31+0*d(Fp31,y)*Fp31+0*d(Fp32,y)*Fp31+1*d(Fp33,y)*Fp31+0*d(Fp31,x)*Fp32+0*d(Fp32,x)*Fp32+-1*d(Fp33,x)*Fp32+0*d(Fp31,y)*Fp32+0*d(Fp32,y)*Fp32+0*d(Fp33,y)*Fp32+0*d(Fp31,x)*Fp33+1*d(Fp32,x)*Fp33+0*d(Fp33,x)*Fp33+-1*d(Fp31,y)*Fp33+0*d(Fp32,y)*Fp33+0*d(Fp33,y)*Fp33)/Jp", "G, component 33");

    model.view().create("view2", 3);
    model.view().create("view3", 3);
    model.view().create("view4", 3);
    model.view().create("view5", 3);
    model.view().create("view6", 3);
    model.view().create("view7", 3);
    model.view().create("view8", 3);
    model.view().create("view9", 3);
    model.view().create("view10", 3);

    model.component("comp1").cpl().create("aveop1", "Average");
    model.component("comp1").cpl("aveop1").selection().set(1);

    model.component("comp1").physics().create("w", "WeakFormPDE", "geom1");
    model.component("comp1").physics("w").field("dimensionless").component(new String[]{"u1", "u2"});
    model.component("comp1").physics("w").prop("Units").set("DependentVariableQuantity", "displacement");
    model.component("comp1").physics("w").create("dir2", "DirichletBoundary", 1);
    model.component("comp1").physics("w").feature("dir2").selection().set(4);
    model.component("comp1").physics("w").create("dir3", "DirichletBoundary", 1);
    model.component("comp1").physics("w").feature("dir3").selection().set(1);
    model.component("comp1").physics("w").create("constr1", "PointwiseConstraint", 0);
    model.component("comp1").physics("w").feature("constr1").selection().set(1);
    model.component("comp1").physics("w").create("constr2", "PointwiseConstraint", 0);
    model.component("comp1").physics("w").feature("constr2").selection().set(1);
    model.component("comp1").physics().create("dode", "DomainODE", "geom1");
    model.component("comp1").physics("dode").field("dimensionless").field("dotFp");
    model.component("comp1").physics("dode").field("dimensionless")
         .component(new String[]{"q1", "q2", "q3", "Up11", "Up22", "Up33", "Up12", "Up13", "Up23"});
    model.component("comp1").physics().create("dode2", "DomainODE", "geom1");
    model.component("comp1").physics("dode2").field("dimensionless").field("h");
    model.component("comp1").physics("dode2").field("dimensionless").component(new String[]{"h"});

    model.component("comp1").mesh("mesh1").create("ftri1", "FreeTri");

    model.result().table("evl3").label("Evaluation 3D");
    model.result().table("evl3").comments("Interactive 3D values");
    model.result().table("tbl1").comments("Total Strain 11");

    model.capeopen().label("Thermodynamics Package");

    model.component("comp1").view("view1").axis().set("xmin", -1.1691176950989757E-6);
    model.component("comp1").view("view1").axis().set("xmax", 4.1691178012115415E-6);
    model.component("comp1").view("view1").axis().set("ymin", -3.794118583755335E-7);
    model.component("comp1").view("view1").axis().set("ymax", 3.3794119644880993E-6);
    model.view("view9").set("showgrid", false);

    model.component("comp1").physics("w").label("Force Balance");
    model.component("comp1").physics("w").feature("wfeq1")
         .set("weak", new String[][]{{"+P11*test(u1x)+P12*test(u1y)"}, {"+P21*test(u2x)+P22*test(u2y)"}});
    model.component("comp1").physics("w").feature("init1").set("u1", "u1_i(x,y)");
    model.component("comp1").physics("w").feature("init1").set("u2", "u2_i(x,y)");
    model.component("comp1").physics("w").feature("dir2").set("r", new String[][]{{"3e-4[m/s]*t"}, {"0"}});
    model.component("comp1").physics("w").feature("dir2").set("useDirichletCondition", new int[][]{{1}, {0}});
    model.component("comp1").physics("w").feature("dir2").label("Dirichlet Boundary Condition 1");
    model.component("comp1").physics("w").feature("dir3").set("useDirichletCondition", new int[][]{{1}, {0}});
    model.component("comp1").physics("w").feature("constr1").set("constraintExpression", "u2");
    model.component("comp1").physics("w").feature("constr1").set("constraintMethod", "nodal");
    model.component("comp1").physics("w").feature("constr2").set("constraintExpression", "u3");
    model.component("comp1").physics("w").feature("constr2").set("constraintMethod", "nodal");
    model.component("comp1").physics("dode").label("Flow rule");
    model.component("comp1").physics("dode").prop("ShapeProperty").set("shapeFunctionType", "shlag");
    model.component("comp1").physics("dode").prop("ShapeProperty").set("order", 1);
    model.component("comp1").physics("dode").prop("Units").set("SourceTermQuantity", "frequencyfactor");
    model.component("comp1").physics("dode").feature("dode1")
         .set("f", new String[][]{{"LpFp11"}, {"LpFp12"}, {"LpFp13"}, {"LpFp21"}, {"LpFp22"}, {"LpFp23"}, {"LpFp31"}, {"LpFp32"}, {"LpFp33"}});
    model.component("comp1").physics("dode").feature("dode1")
         .set("da", new String[][]{{"da11"}, 
         {"da21"}, 
         {"da31"}, 
         {"da41"}, 
         {"da51"}, 
         {"da61"}, 
         {"da71"}, 
         {"da81"}, 
         {"da91"}, 
         {"da12"}, 
         {"da22"}, 
         {"da32"}, 
         {"da42"}, 
         {"da52"}, 
         {"da62"}, 
         {"da72"}, 
         {"da82"}, 
         {"da92"}, 
         {"da13"}, 
         {"da23"}, 
         {"da33"}, 
         {"da43"}, 
         {"da53"}, 
         {"da63"}, 
         {"da73"}, 
         {"da83"}, 
         {"da93"}, 
         {"da14"}, 
         {"da24"}, 
         {"da34"}, 
         {"da44"}, 
         {"da54"}, 
         {"da64"}, 
         {"da74"}, 
         {"da84"}, 
         {"da94"}, 
         {"da15"}, 
         {"da25"}, 
         {"da35"}, 
         {"da45"}, 
         {"da55"}, 
         {"da65"}, 
         {"da75"}, 
         {"da85"}, 
         {"da95"}, 
         {"da16"}, 
         {"da26"}, 
         {"da36"}, 
         {"da46"}, 
         {"da56"}, 
         {"da66"}, 
         {"da76"}, 
         {"da86"}, 
         {"da96"}, 
         {"da17"}, 
         {"da27"}, 
         {"da37"}, 
         {"da47"}, 
         {"da57"}, 
         {"da67"}, 
         {"da77"}, 
         {"da87"}, 
         {"da97"}, 
         {"da18"}, 
         {"da28"}, 
         {"da38"}, 
         {"da48"}, 
         {"da58"}, 
         {"da68"}, 
         {"da78"}, 
         {"da88"}, 
         {"da98"}, 
         {"da19"}, 
         {"da29"}, 
         {"da39"}, 
         {"da49"}, 
         {"da59"}, 
         {"da69"}, 
         {"da79"}, 
         {"da89"}, 
         {"da99"}});
    model.component("comp1").physics("dode").feature("init1").set("q1", "qi1(x,y)");
    model.component("comp1").physics("dode").feature("init1").set("q2", "qi2(x,y)");
    model.component("comp1").physics("dode").feature("init1").set("q3", "qi3(x,y)");
    model.component("comp1").physics("dode").feature("init1").set("Up11", 1);
    model.component("comp1").physics("dode").feature("init1").set("Up22", 1);
    model.component("comp1").physics("dode").feature("init1").set("Up33", 1);
    model.component("comp1").physics("dode2").label("dislocation density");
    model.component("comp1").physics("dode2").prop("ShapeProperty").set("shapeFunctionType", "shlag");
    model.component("comp1").physics("dode2").prop("ShapeProperty").set("order", 1);
    model.component("comp1").physics("dode2").prop("Units").set("SourceTermQuantity", "frequencyfactor");
    model.component("comp1").physics("dode2").feature("dode1").set("f", "doth");
    model.component("comp1").physics("dode2").feature("init1").set("h", "h_i(x,y)");

    model.component("comp1").mesh("mesh1").feature("size").set("hauto", 8);
    model.component("comp1").mesh("mesh1").feature("ftri1").set("method", "del");
    model.component("comp1").mesh("mesh1").run();

    model.study().create("std1");
    model.study("std1").create("time", "Transient");

    model.sol().create("sol1");
    model.sol("sol1").study("std1");
    model.sol("sol1").attach("std1");
    model.sol("sol1").create("st1", "StudyStep");
    model.sol("sol1").create("v1", "Variables");
    model.sol("sol1").create("t1", "Time");
    model.sol("sol1").feature("t1").create("se1", "Segregated");
    model.sol("sol1").feature("t1").feature("se1").create("ss1", "SegregatedStep");
    model.sol("sol1").feature("t1").feature("se1").create("ss2", "SegregatedStep");
    model.sol("sol1").feature("t1").feature("se1").create("ss3", "SegregatedStep");
    model.sol("sol1").feature("t1").feature("se1").create("ll1", "LowerLimit");
    model.sol("sol1").feature("t1").feature("se1").feature().remove("ssDef");
    model.sol("sol1").feature("t1").feature().remove("fcDef");

    model.result().numerical().create("av1", "AvLine");
    model.result().numerical("av1").selection().set(1, 4);
    model.result().numerical("av1").set("probetag", "none");
    model.result().create("pg1", "PlotGroup2D");
    model.result().create("pg3", "PlotGroup1D");
    model.result("pg1").create("surf1", "Surface");
    model.result("pg1").create("surf2", "Surface");
    model.result("pg1").create("surf3", "Surface");
    model.result("pg1").create("surf4", "Surface");
    model.result("pg1").create("surf5", "Surface");
    model.result("pg1").create("surf6", "Surface");
    model.result("pg1").feature("surf1").set("data", "dset1");
    model.result("pg1").feature("surf2").set("expr", "u2");
    model.result("pg1").feature("surf3").set("expr", "h");
    model.result("pg1").feature("surf4").set("expr", "q1");
    model.result("pg1").feature("surf5").set("expr", "q2");
    model.result("pg1").feature("surf6").set("expr", "q3");
    model.result("pg3").create("tblp1", "Table");
    model.result().export().create("plot1", "Plot");
    model.result().export().create("plot2", "Plot");
    model.result().export().create("plot3", "Plot");
    model.result().export().create("plot4", "Plot");
    model.result().export().create("plot5", "Plot");
    model.result().export().create("plot6", "Plot");

    model.study("std1").feature("time").set("tlist", "range(0,5.0e-6,40.0e-6)");
    model.study("std1").feature("time").set("plot", true);
    model.study("std1").feature("time").set("usertol", true); //added absolute tolerance to speed up
    model.study("std1").feature("time").set("rtol", 0.1); //added to speed up

    model.sol("sol1").attach("std1");
    model.sol("sol1").feature("v1").set("resscalemethod", "auto");
    model.sol("sol1").feature("v1").set("clist", new String[]{"range(0,5.0e-6,40.0e-6)", "1.000000000000000E-8[s]"});
    model.sol("sol1").feature("t1").set("control", "user");
    model.sol("sol1").feature("t1").set("tlist", "range(0,5.0e-6,40.0e-6)");
    model.sol("sol1").feature("t1").set("atolglobalvaluemethod", "manual");
    model.sol("sol1").feature("t1")
         .set("atolvaluemethod", new String[]{"comp1_h", "manual", "comp1_q1", "manual", "comp1_q2", "manual", "comp1_q3", "manual", "comp1_u1", "manual", 
         "comp1_u2", "manual", "comp1_Up11", "manual", "comp1_Up12", "manual", "comp1_Up13", "manual", "comp1_Up22", "manual", 
         "comp1_Up23", "manual", "comp1_Up33", "manual"});
    model.sol("sol1").feature("t1").set("plot", true);
    model.sol("sol1").feature("t1").feature("dDef").set("ooc", false);
    model.sol("sol1").feature("t1").feature("se1").set("segstabacc", "segaacc");
    model.sol("sol1").feature("t1").feature("se1").feature("ss1").set("subdtech", "hnlin");
    model.sol("sol1").feature("t1").feature("se1").feature("ll1").set("lowerlimit", "comp1.h 0");
    model.sol("sol1").runAll();

    model.result().numerical("av1").label("Total Strain and Stress 11");
    model.result().numerical("av1").set("table", "tbl1");
    model.result().numerical("av1").set("expr", new String[]{"(F11*F11+F12*F12+F13*F13-1)/2", "W11"});
    model.result().numerical("av1").set("unit", new String[]{"1", "Pa"});
    model.result().numerical("av1").set("descr", new String[]{"", "intermediate stress, component 11"});
    model.result().numerical("av1").setResult();
    model.result("pg1").feature("surf1").label("u1");
    model.result("pg1").feature("surf1").set("descr", "Dependent variable u1");
    model.result("pg1").feature("surf1").set("resolution", "normal");
    model.result("pg1").feature("surf2").label("u2");
    model.result("pg1").feature("surf2").set("resolution", "normal");
    model.result("pg1").feature("surf3").label("dislocation density");
    model.result("pg1").feature("surf3").set("resolution", "normal");
    model.result("pg1").feature("surf4").label("q1");
    model.result("pg1").feature("surf4").set("resolution", "normal");
    model.result("pg1").feature("surf5").label("q2");
    model.result("pg1").feature("surf5").set("resolution", "normal");
    model.result("pg1").feature("surf6").label("q3");
    model.result("pg1").feature("surf6").set("resolution", "normal");

    model.result().numerical("av1").set("expr", new String[]{});
    model.result().numerical("av1").set("descr", new String[]{});
    model.result().numerical("av1").setIndex("expr", "(F11*F11+F12*F12+F13*F13-1)/2", 0);
    model.result().numerical("av1").setIndex("expr", "W11", 1);
    model.result().table().create("tbl2", "Table");
    model.result().table("tbl2").comments("Line Average 1");
    model.result().numerical("av1").set("table", "tbl2");
    model.result().numerical("av1").setResult();
    model.result().table("tbl2").save("./COMSOL_output/strain_stress.txt");

    model.result().export("plot1").label("u1");
    model.result().export("plot1").set("filename", "./COMSOL_output/u1.txt");
    model.result().export("plot1").set("header", false);
    model.result().export("plot1").run();
    model.result().export("plot2").label("u2");
    model.result().export("plot2").set("plot", "surf2");
    model.result().export("plot2").set("filename", "./COMSOL_output/u2.txt");
    model.result().export("plot2").set("header", false);
    model.result().export("plot2").run();
    model.result().export("plot3").label("dislocation density");
    model.result().export("plot3").set("plot", "surf3");
    model.result().export("plot3").set("filename", "./COMSOL_output/dislocationDensity.txt");
    model.result().export("plot3").set("header", false);
    model.result().export("plot3").run();
    model.result().export("plot4").label("q1");
    model.result().export("plot4").set("plot", "surf4");
    model.result().export("plot4").set("filename", "./COMSOL_output/orientation1.txt");
    model.result().export("plot4").set("header", false);
    model.result().export("plot4").run();
    model.result().export("plot5").label("q2");
    model.result().export("plot5").set("plot", "surf5");
    model.result().export("plot5").set("filename", "./COMSOL_output/orientation2.txt");
    model.result().export("plot5").set("header", false);
    model.result().export("plot5").run();
    model.result().export("plot6").label("q3");
    model.result().export("plot6").set("plot", "surf6");
    model.result().export("plot6").set("filename", "./COMSOL_output/orientation3.txt");
    model.result().export("plot6").set("header", false);
    model.result().export("plot6").run();

    return model;
  }

  public static void main(String[] args) {
    Model model = run();
    model = run2(model);
    model = run3(model);
    run4(model);
  }

}
