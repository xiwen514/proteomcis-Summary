#!/bin/bash
# xml_test the newest xml file  renames as mqpar.xml
cp  xml_test/42.xml mqpar.xml
dotnet /home/xiwenz/software/MaxQuant_2.0.1.0/bin/MaxQuantCmd.exe mqpar.xml