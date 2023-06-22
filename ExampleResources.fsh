Instance: PatientExample1
InstanceOf: Patient
Description: "An example patient used in the example resources."
* gender = #male
* birthDate = "1996-12-23"
* address.use = #home
* address.type = #both
* address.state = "MA"

Instance: PractitionerExample1
InstanceOf: Practitioner
Description: "An example practitioner referred by the example resources."
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1122334455"
* name.family = "Doe"
* name.given = "Jane"
* name.prefix = "Dr."

Instance: ServiceRequestExample1
InstanceOf: ServiceRequest
Usage: #inline
* status = #active
* intent = #original-order
* code = http://loinc.org#24338-6
* code.text = "Gas panel - Blood"
* subject = Reference(PatientExample1)
* occurrenceDateTime = "2019-05-08T09:33:27+07:00"
* requester = Reference(PractitionerExample1) "Dr. Jane Doe"
* reasonCode.text = "Check for O2 blood saturation levels"

Instance: OrgExample1
InstanceOf: Organization
Description: "An instance of Organization as a payer used in the example resources."
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "Insurance Company"
* active = true
* telecom.system = #phone
* telecom.value = "860-547-5001"
* telecom.use = #work
* address.line = "680 Asylum Street"
* address.city = "Hartford"
* address.state = "CT"
* address.postalCode = "06155"
* address.country = "US"

Instance: CoverageExample1
InstanceOf: Coverage
Description: "An instance of Coverage used in the example resources."
* subscriber = Reference(PatientExample1)
* beneficiary = Reference(PatientExample1)
* status = #active
* payor = Reference(OrgExample1)

Instance: DeviceRequest1
InstanceOf: DeviceRequest
Description: "An example device request used in the example resources."
* status = #active
* intent = #original-order
* codeCodeableConcept = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#E0424 "Stationary Compressed Gaseous Oxygen System, Rental"
* subject = Reference(PatientExample1)
* occurrenceDateTime = "2022-01-08T09:33:27+07:00"
* requester = Reference(PractitionerExample1) "Dr. Jane Doe"

Instance: DTRCoverageExample1
InstanceOf: DTRCoverage
Description: "An instance of DTRCoverage"
* subscriber = Reference(PatientExample1)
* beneficiary = Reference(PatientExample1)
* relationship = RELATE#self "Self"
* status = #active
* class.name = "Premim Family Plus Plan"
* class.type = COVCLASS#plan "Plan"
* class.value = "Premim Family Plus"
* period.start = "2022-01-01"
* period.end = "2023-01-01"
* payor = Reference(OrgExample1)
* subscriberId = "PFP123450000"
* costToBeneficiary.type = COPAYTYPE#copaypct "Copay Percentage"
* costToBeneficiary.valueQuantity.value = 20.00

Instance: DTRParametersExample
InstanceOf: Parameters
Description: "An example Parameters resource for DTRQuestionnairePackageOperation"
Usage: #example
* parameter[0].name = "coverage"
* parameter[=].resource = DTRCoverageExample1
* parameter[+].name = "order"
* parameter[=].resource = DeviceRequest1
* parameter[+].name = "questionnaire"
* parameter[=].resource = home-o2-sdc-questionnaire
* parameter[+].name = "changedsince"
* parameter[=].valueDateTime = "2023-04-20T00:00:00+00:00"