# MX_logger - Logging framework for salesforce and Vlocity


To log the information in code, there is Custom Logger  MX_Logger, which can be used in apex and vlocity IP.

 

All the logs will be generated in **CommonLogs__c** object


<table>
  <tr><td><b>Field Name</b></td><td><b>Field Label</b></td><td><b>Comments</b></td></tr>
   <tr><td>MX_ComponentType__c</td><td>Component Type</td><td>Type of the component eg : Class Name, IP (Integration Procedure), CP (Calculation Procedure) etc</td></tr>
  <tr><td>MX_ComponentName__c</td><td>Component Name</td><td>Name of the Component eg : Method Name, IP Name, CP Name etc.</td></tr>
  <tr><td>MX_LoggingLevel__c</td><td>Logging Level</td><td>FINE, DEBUG, INFO, WARN, ERROR</td></tr>
  <tr><td>MX_Message__c</td><td>Message</td><td>Message to log</td></tr>
    <tr><td>MX_Stacktrace__c</td><td>Stacktrace</td><td>Stacktrace to log in case of exceptions</td></tr>
</table>


 

## Apex Logging 
### create Logger Instance for the class
#### MX_Logger logger = MX_LoggerFactory.createLogger(<class>.class.getName());

 

### Methods -
 

public void fine (String methodName, String message)

public void fine (String methodName, String message, Object[] arguments)

 

public void debug (String methodName, String message)

public void debug (String methodName, String message, Object[] arguments)

 

public void info (String methodName, String message)

public void info (String methodName, String message, Object[] arguments)

 

public void warn (String methodName, String message)

public void warn (String methodName, String message, Object[] arguments)

 

public void error (String methodName, String message)

public void error (String methodName, String message, Object[] arguments)

 

public void error (String methodName, String message, Exception ex)

public void error (String methodName, String message, Object[] arguments, Exception ex)
 

## Remote Action For Logging in IP
 

#### Remote Class - MX_Logger

#### Remote Methods - fine, debug, info, warn, error

#### Inputs - ComponentType, ComponentName, Message and Arguments (Optional);

##### Custom Settings - MX Logging Configurations

<table>
  <tr><td><b>Field Label</b></td><td><b>Value</b></td></td></tr>
   <tr><td>Name</td><td>Default</td></tr>
     <tr><td>MX Logging Level</td><td>FINE (any logging level)</td></tr>
       <tr><td>MX Logging Enabled</td><td>true</td></tr>
</table>
 

###### How it works
FINE → DEBUG → INFO → WARN → ERROR

If Logging Level  is set as DEBUG it will be generating logs for all the following levels i.e. DEBUG, INFO, WARN, ERROR
