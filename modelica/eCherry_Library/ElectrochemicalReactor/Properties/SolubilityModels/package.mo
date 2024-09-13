within eCherry_Library.ElectrochemicalReactor.Properties;
package SolubilityModels "Henry's law for Equilibria of Gases"
      extends Modelica.Icons.Package;
         // WORKS
                                            //WORKING!
  /* Approach from
@article{Battino.1984,
 author = {Battino, Rubin and Rettich, Timothy R. and Tominaga, Toshihiro},
 year = {1984},
 title = {The Solubility of Nitrogen and Air in Liquids},
 pages = {563--600},
 volume = {13},
 number = {2},
 issn = {0047-2689},
 journal = {Journal of Physical and Chemical Reference Data},
 doi = {10.1063/1.555713},
 file = {Battino, Rettich et al. 1984 - The Solubility of Nitrogen:Attachments/Battino, Rettich et al. 1984 - The Solubility of Nitrogen.pdf:application/pdf}
 }
 */
                                      // WORKING
  // !!!!!!!!!!!!!! inverse approach x=p/H !!!!!!!!!
  /* Approach from
  BK approach!
@article{Rettich.1984,
 author = {Rettich, T. R. and Battino, Rubin and Wilhelm, Emmerich},
 year = {1984},
 title = {Solubility of gases in liquids. XVI. Henry's law coefficients for nitrogen in water at 5 to 50C},
 pages = {335--348},
 volume = {13},
 number = {5},
 issn = {0095-9782},
 journal = {Journal of Solution Chemistry},
 doi = {10.1007/BF00645706},
 file = {Rettich, Battino et al. 1984 - Solubility of gases in liquids:Attachments/Rettich, Battino et al. 1984 - Solubility of gases in liquids.pdf:application/pdf}
}
 */
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Text(
            textColor={128,128,128},
            extent={{-90,-90},{90,90}},
            textString="H")}));
end SolubilityModels;
