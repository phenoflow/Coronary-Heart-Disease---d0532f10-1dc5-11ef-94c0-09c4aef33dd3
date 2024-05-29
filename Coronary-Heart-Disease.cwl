cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ischemic-coronary-heart-disease-chd---primary:
    run: ischemic-coronary-heart-disease-chd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  coronary-heart-disease-chd-ischaemia---primary:
    run: coronary-heart-disease-chd-ischaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ischemic-coronary-heart-disease-chd---primary/output
  coronary-heart-disease-chd---primary:
    run: coronary-heart-disease-chd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-ischaemia---primary/output
  coronary-heart-disease-chd-review---primary:
    run: coronary-heart-disease-chd-review---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd---primary/output
  coronary-heart-disease-chd-aborted---primary:
    run: coronary-heart-disease-chd-aborted---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-review---primary/output
  coronary-heart-disease-chd-artery---primary:
    run: coronary-heart-disease-chd-artery---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-aborted---primary/output
  silent-coronary-heart-disease-chd---primary:
    run: silent-coronary-heart-disease-chd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-artery---primary/output
  atherosclerotic-coronary-heart-disease-chd---primary:
    run: atherosclerotic-coronary-heart-disease-chd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: silent-coronary-heart-disease-chd---primary/output
  cardiovascular-coronary-heart-disease-chd---primary:
    run: cardiovascular-coronary-heart-disease-chd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: atherosclerotic-coronary-heart-disease-chd---primary/output
  coronary-heart-disease-chd-aneurysm---primary:
    run: coronary-heart-disease-chd-aneurysm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: cardiovascular-coronary-heart-disease-chd---primary/output
  coronary-heart-disease-chd-infarction---primary:
    run: coronary-heart-disease-chd-infarction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-aneurysm---primary/output
  certain-coronary-heart-disease-chd---primary:
    run: certain-coronary-heart-disease-chd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-infarction---primary/output
  coronary-heart-disease-chd-pectoris---primary:
    run: coronary-heart-disease-chd-pectoris---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: certain-coronary-heart-disease-chd---primary/output
  coronary-heart-disease-chd-subacute---primary:
    run: coronary-heart-disease-chd-subacute---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-pectoris---primary/output
  coronary-heart-disease-chd-rupture---primary:
    run: coronary-heart-disease-chd-rupture---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-subacute---primary/output
  coronary-heart-disease-chd-unspecified---primary:
    run: coronary-heart-disease-chd-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-rupture---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-chd-unspecified---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
