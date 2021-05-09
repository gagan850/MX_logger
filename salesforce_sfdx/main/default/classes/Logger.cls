/**
* @name: Logger
* @description: abstract class for logging
* @author: Gagandeep Bansal gagandeep.bansal@salesforce.com
* @date: 04/05/2021
* @group MX Logging Framework   
*/
public abstract class Logger {

    private static final String DEFAULT_LOGGING_LEVEL_KEY   = 'Default';

    
    //to store custom settings
    private boolean isLoggingEnabled;
    private LoggingLevel defaultLoggingLevel;
    
    /*
    *    LoggingLevel    ordinal 
    *       NONE            0
    *       INTERNAL        1
    *       FINEST          2
    *       FINER           3
    *       FINE            4
    *       DEBUG           5
    *       INFO            6
    *       WARN            7
    *       ERROR           8
    */

    protected void log (LoggingLevel logLevel, String componentType, String componentName, String message, String stacktrace) {
        populateLoggingConfigurations();
        
        if (!this.isLoggingEnabled) {
            return;
        }
        
        if (LoggingLevel.NONE == this.defaultLoggingLevel) {
            return;
        }
        
        if (this.defaultLoggingLevel.ordinal() <= logLevel.ordinal()) {
            MX_CommonLog__c commonLog = createLogEvent(componentType, componentName, message, stacktrace, logLevel.name());
            publishLogEvent(commonLog);
        }   
    }
    
    private void populateLoggingConfigurations () {
        MX_LoggingConfigurations__c logConfSettings   = MX_LoggingConfigurations__c.getValues(DEFAULT_LOGGING_LEVEL_KEY);
        if (null != logConfSettings) {
            this.isLoggingEnabled                     = logConfSettings.MX_LoggingEnabled__c;
            this.defaultLoggingLevel                  = LoggingLevel.NONE;
            
            for (LoggingLevel systemLoggingLevel : LoggingLevel.values()) {
                if (systemLoggingLevel.name() == logConfSettings.MX_LoggingLevel__c) {
                    this.defaultLoggingLevel = systemLoggingLevel;
                    break;
                }
            }                         
        } 
        
    }

    protected void log (LoggingLevel logLevel, String componentType, String componentName, String message) {
        log(logLevel, componentType, componentName, message, null);
    }

    private MX_CommonLog__c createLogEvent (String componentType, String componentName, String message, String stacktrace, String loggingLevel) {
        MX_CommonLog__c commonLog = new MX_CommonLog__c (
            MX_ComponentType__c    = componentType,
            MX_ComponentName__c    = componentName,
            MX_Message__c          = message == null ? null : String.valueOf(message),
            MX_Stacktrace__c       = stacktrace == null ? null : String.valueOf(stacktrace),
            MX_LoggingLevel__c     = loggingLevel
        );
        return commonLog;
    }

    private void publishLogEvent (MX_CommonLog__c commonLog) {
        try {
            insert commonLog;
        } catch (DMLException ex) {
            System.debug ('Error while logging : ' + ex.getMessage());
        }
    }
}