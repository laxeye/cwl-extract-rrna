#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Filter and reformat tblout of cmsearch

baseCommand: [awk, '{if(!/^#/) print $3,$8,$9,$1}']

inputs:
  tbl:
    type: File
    inputBinding:
      position: 2

outputs:
  coords:
    type: File
    outputBinding: 
      glob: "*.txt"

stdout: $(inputs.tbl.nameroot).txt
