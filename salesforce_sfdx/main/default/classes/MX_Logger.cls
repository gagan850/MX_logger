/**
* @name: MX_Logger
* @description: MX_Logger, to log the messages
* @author: Gagandeep Bansal gagandeep.bansal@salesforce.com
* @date: 04/05/2021
* @group MX Logging Framework   
*/
global class MX_Logger extends Logger implements vlocity_ins.VlocityOpenInterface {

    private String className { get; set; }

    public MX_Logger () {
        //required by vlocity_ins.VlocityOpenInterface to instantiate the class in vlocity implementation 
    }
    
    public MX_Logger (String className) {
        this.className = className;
    }

    /**
    * @description to generate trace logs
    * @param methodName method name for which log is to generate
    * @param message trace message to log
    */
    public void fine (String methodName, String message) {
        log (LoggingLevel.FINE, this.className, methodName, message);
    }

    /**
    * @description to generate trace logs
    * @param methodName method name for which log is to generate
    * @param message trace message to log
    * @param arguments  helps to generate the log message using placeholders
    */
    public void fine (String methodName, String message, Object[] arguments) {
        log (LoggingLevel.FINE, this.className, methodName, String.format(message, arguments));
    }

    /**
    * @description to generate debug logs
    * @param methodName method name for which log is to generate
    * @param message debug message to log
    */
    public void debug (String methodName, String message) {
        log (LoggingLevel.DEBUG, this.className, methodName, message);
    }

    /**
    * @description to generate debug logs
    * @param methodName method name for which log is to generate
    * @param message debug message to log
    * @param arguments  helps to generate the log message using placeholders
    */
    public void debug (String methodName, String message, Object[] arguments) {
        log (LoggingLevel.DEBUG, this.className, methodName, String.format(message, arguments));
    }
    
    /**
    * @description to generate info logs
    * @param methodName method name for which log is to generate
    * @param message info message to log
    */
    public void info (String methodName, String message) {
        log (LoggingLevel.INFO, this.className, methodName, message);
    }

    /**
    * @description to generate info logs
    * @param methodName method name for which log is to generate
    * @param message info message to log
    * @param arguments  helps to generate the log message using placeholders
    */
    public void info (String methodName, String message, Object[] arguments) {
        log (LoggingLevel.INFO, this.className, methodName, String.format(message, arguments));
    }

    /**
    * @description to generate warn logs
    * @param methodName method name for which log is to generate
    * @param message warn message to log
    */
    public void warn (String methodName, String message) {
        log (LoggingLevel.WARN, this.className, methodName, message);
    }

    /**
    * @description to generate warn logs
    * @param methodName method name for which log is to generate
    * @param message warn message to log
    * @param arguments  helps to generate the log message using placeholders
    */
    public void warn (String methodName, String message, Object[] arguments) {
        log (LoggingLevel.WARN, this.className, methodName, String.format(message, arguments));
    }

    /**
    * @description to generate error logs
    * @param methodName method name for which log is to generate
    * @param message error message to log
    */
    public void error (String methodName, String message) {
        log (LoggingLevel.ERROR, this.className, methodName, message);
    }

    /**
    * @description to generate error logs
    * @param methodName method name for which log is to generate
    * @param message error message to log
    * @param arguments  helps to generate the log message using placeholders
    */
    public void error (String methodName, String message, Object[] arguments) {
        log (LoggingLevel.ERROR, this.className, methodName, String.format(message, arguments));
    }
    
    /**
    * @description to generate error logs
    * @param methodName method name for which log is to generate
    * @param message error message to log
    * @param ex to log the exception stacktrace
    */
    public void error (String methodName, String message, Exception ex) {
        String stacktrace = ex != null? ex.getStackTraceString() : null;
        log (LoggingLevel.ERROR, this.className, methodName, message, stacktrace);
    }

    /**
    * @description to generate error logs
    * @param methodName method name for which log is to generate
    * @param message error message to log
    * @param arguments  helps to generate the log message using placeholders
    * @param ex to log the exception stacktrace
    */
    public void error (String methodName, String message, Object[] arguments, Exception ex) {
        String stacktrace = ex != null? ex.getStackTraceString() : null;
        log (LoggingLevel.ERROR, this.className, methodName, String.format(message, arguments), stacktrace);
    }

    public Boolean invokeMethod(String methodName, Map < String, Object > input, Map < String, Object > outMap, Map < String, Object > options) {
        Boolean result = true;
            
            
        if (methodName == 'fine' || methodName == 'debug' || methodName == 'info' || methodName == 'warn' || methodName == 'error') {
            try {
            String componentType             = (String)input.get('ComponentType');
            String componentName             = (String)input.get('ComponentName');
            String message                   = (String)input.get('Message');
            List<Object> arguments           = null;

            
            LoggingLevel loggingLevel        = getLoggingLevel(methodName.toUpperCase());
            if (null != input.get('Arguments')) {
                arguments   = (List<Object>)input.get('Arguments');
                this.log(loggingLevel, componentType, componentName, String.format(message, arguments));
                
            } else {
                this.log(loggingLevel, componentType, componentName, message);
            }

            } catch (Exception ex) {
               throw new MX_Exception('Exception occured while logging for input : {0}, error message : {1}',
                new List<Object>{JSON.serialize(input), ex.getMessage()});         
            }
        }                              
        else {
            throw new MX_Exception('Invalid LoggingLevel {0}!!, Expected Logging Levels are {1}, {2}, {3}, {4} and {5}' ,
             new List<Object>{methodName, 'fine', 'debug', 'info', 'warn', 'error'});
        }
        
        return true;
    }
    
    private LoggingLevel getLoggingLevel (String level) {
        switch on level {
            when 'FINE' {
                return LoggingLevel.FINE;
            } 
             when 'DEBUG' {
                return LoggingLevel.DEBUG;
            }
            when 'INFO' {
                return LoggingLevel.INFO;
            }
             when 'WARN' {
                return LoggingLevel.WARN;
            }
             when else {
                return LoggingLevel.ERROR;
            }
        }
    }
}