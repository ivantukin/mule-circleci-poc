*** Settings ***
Library         REST              http://wrapper-api-staging.us-e1.cloudhub.io
*** Variables ***
${building_uuid}    96266325-3df5-43a4-8b22-35a6d3aa1c2b
${quantity}			1
*** Test Cases ***
RESTinstance: Test1 with quantity
    GET         /api/revstarpricing?building_uuid=${building_uuid}&quantity=${quantity}	
    Output      $
	Integer     response status   200
	String      $.message         Successfully
	Number      $.price
RESTinstance: Test2 no quantity
    GET         /api/revstarpricing?building_uuid=${building_uuid}	
    Output      $
	Integer     response status   200
	String      $.message         Successfully
	Number      $.price
RESTinstance: Test3 incorrect building
    GET         /api/revstarpricing?building_uuid=INVALID&quantity=${quantity}		
    Output      $
	Integer     $.status   200
	Number      $.price    500
