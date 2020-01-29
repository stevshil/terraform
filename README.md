# terraform

To run some of the code use the **make** command.  The Makefile contains various actions.

* Plan
  - ```make plan```
* Create
  - ```make apply```
* Destroy
  - ```make clean```
* Modify a specific part
  - ```make fix target=<tf-path>```

NOTE: The plan actually tests the Lambda and key by getting the outputs.  This requires JQ to be installed on your system as the **testgw** script runs at the end of plan.
