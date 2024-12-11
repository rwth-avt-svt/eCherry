# eCherry Public Version
 Welcome to eCherry, a modelica library to model electrochemical systems.
 In this repository you will find all the parts to build your own model of an electrochemical reactor or electrolyzer.
Additionally, you will also find multiple working examples. 

eCherry is in active development and over time we will add more features and a detailed documentation to aid the user.
If you have any questions/comments: write a ticket or mail us at: electrochemistry.SVT [ät] avt.rwth-aachen.de-
There is also a publication on its way which we will integrate here asap.

# getting started
If you want to use eCherry: [how to get started](https://git.rwth-aachen.de/avt-svt/public/echerry/-/wikis/Getting-Started).
Further explanation can be found in the [wiki](https://git.rwth-aachen.de/avt-svt/public/echerry/-/wikis/home).
# more detailed explanation
With the rising need of defossilizing the chemical industry, the development of processes comprised of electrochemical reactors has become increasingly of interest. Since experimental investigations of novel reactor concepts are costly and time-intensive, computer-aided methods may aid in the design process. However, existing computer-aided models of electrochemical reactors have been tailored for one specific process concept, which makes them hard to reapply for other research questions with slightly different reactor and process concepts. Such reusability and adjustability can be achieved by (open) modeling libraries, which are well established in computer-aided process engineering for applications. However, we find such libraries lacking for electrochemical applications.

Herein, we present an open-source library in the modeling language Modelica that allows building models for a variety of (dynamic) electrochemical applications. We name it the Electrochemical Reactor Dynamics Modelica Library (eCherry). Modularization, inheritance, and aggregation as well as easy-to-use graphical representation allow the user to build highly customizable models in a quick and easy-to-understand way based on a structured modeling approach.

The model library comprises models for different components of electrochemical reactors that can be connected to form models of an overall reactor. Internally, these are again composed of models for individual phenomena, including model equations describing, e.g., conservation of species, transport phenomena, or (chemical and electrochemical) reactions. The component models contain connectors that allow exchange of material or current with other components. This library is written in the open-source and object-oriented modeling language Modelica, which allows the interconnection to other well-established libraries in Modelica.



=====================================================================  \n

(c) Lehrstuhl fuer Systemverfahrenstechnik/Prozesstechnik, RWTH Aachen \n
=====================================================================  \n


eCherry has been developed and is under continuous development at AVT.SVT (RWTH Aachen). 
We are grateful for 
funding from DFG, EU and BMBF that have contributed directly or indirectly to eCherry.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.


You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/.

