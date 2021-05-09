/**
* @name: MX_LoggerFactory
* @description: MX_LoggerFactory, to instantiate the MX Logger, to log messages
* @author: Gagandeep Bansal gagandeep.bansal@movinx.com
* @date: 04/05/2021
* @group MX Logging Framework   
*/
public class MX_LoggerFactory {

    /**
    * @name: createLogger
    * @description to create  MX_Logger instance
    * @param className class for which logger is being instantiated
    * @return MX_Logger, instance of MX_Logger for the class
    */
    public static MX_Logger createLogger (String className) {
        return new MX_Logger(className);
    }
}