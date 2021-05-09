/**
* @name: MX_LoggerTest
* @description: Test class for MX_LoggerTest
* @author: Gagandeep Bansal gagandeep.bansal@movinx.com
* @date: 04/05/2021
* @group MX Logging Framework   
*/
@isTest
public class MX_LoggerTest {

    private static MX_Logger logger = MX_LoggerFactory.createLogger(MX_LoggerTest.class.getName()); 


    @isTest
    public static void testFine(){ 
        
        MX_LoggingConfigurations__c logConfSetting = new MX_LoggingConfigurations__c(Name='Default', MX_LoggingLevel__c='TRACE');
        insert logConfSetting;
        
        Test.startTest();
        logger.fine('testFineMethod', 'testFineMethod');
        logger.fine('testFineMethod2', '{0}', new Object[]{'testFineMethod2'});
        Test.stopTest();
        
        MX_CommonLog__c log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testFineMethod' Limit 1];
        System.assertEquals('testFineMethod', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testFineMethod2' Limit 1];
        System.assertEquals('testFineMethod2', log.MX_ComponentName__c); 
    }
    
    @isTest
    public static void testDebug(){ 

        MX_LoggingConfigurations__c logConfSetting = new MX_LoggingConfigurations__c(Name='Default', MX_LoggingLevel__c='TRACE');
        insert logConfSetting;
        
        Test.startTest();
        logger.debug('testDebugMethod', 'testDebugMethod');
        logger.debug('testDebugMethod2', '{0}', new Object[]{'testDebugMethod2'});
        Test.stopTest();
        
        MX_CommonLog__c log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testDebugMethod' Limit 1];
        System.assertEquals('testDebugMethod', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testDebugMethod2' Limit 1];
        System.assertEquals('testDebugMethod2', log.MX_ComponentName__c); 
    }
    
    @isTest
    public static void testInfo(){ 

        MX_LoggingConfigurations__c logConfSetting = new MX_LoggingConfigurations__c(Name='Default', MX_LoggingLevel__c='TRACE');
        insert logConfSetting;
        
        Test.startTest();
        logger.info('testInfoMethod', 'testInfoMethod');
        logger.info('testInfoMethod2', '{0}', new Object[]{'testInfoMethod2'});
        Test.stopTest();
        
        MX_CommonLog__c log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testInfoMethod' Limit 1];
        System.assertEquals('testInfoMethod', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testInfoMethod2' Limit 1];
        System.assertEquals('testInfoMethod2', log.MX_ComponentName__c); 
    }
    
    @isTest
    public static void testWarn(){ 

        MX_LoggingConfigurations__c logConfSetting = new MX_LoggingConfigurations__c(Name='Default', MX_LoggingLevel__c='TRACE');
        insert logConfSetting;
        
        Test.startTest();
        logger.warn('testWarnMethod', 'testWarnMethod');
        logger.warn('testWarnMethod2', '{0}', new Object[]{'testWarnMethod2'});
        Test.stopTest();
        
        MX_CommonLog__c log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testWarnMethod' Limit 1];
        System.assertEquals('testWarnMethod', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testWarnMethod2' Limit 1];
        System.assertEquals('testWarnMethod2', log.MX_ComponentName__c); 
    }
    
    @isTest
    public static void testError(){ 

        MX_LoggingConfigurations__c logConfSetting = new MX_LoggingConfigurations__c(Name='Default', MX_LoggingLevel__c='TRACE');
        insert logConfSetting;
        
        Test.startTest();
        logger.error('testErrorMethod', 'testErrorMethod');
        logger.error('testErrorMethod2', '{0}', new Object[]{'testErrorMethod2'});
        logger.error('testErrorMethod3', 'testErrorMethod3', new MX_Exception());
        logger.error('testErrorMethod4', '{0}', new Object[]{'testErrorMethod4'}, new MX_Exception());
        Test.stopTest();
        
        MX_CommonLog__c log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod' Limit 1];
        System.assertEquals('testErrorMethod', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod2' Limit 1];
        System.assertEquals('testErrorMethod2', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod3' Limit 1];
        System.assertEquals('testErrorMethod3', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod4' Limit 1];
        System.assertEquals('testErrorMethod4', log.MX_ComponentName__c); 
    }
    
    @isTest
    public static void testWithLoggingLevelError(){ 

        MX_LoggingConfigurations__c logConfSetting = new MX_LoggingConfigurations__c(Name='Default', MX_LoggingLevel__c='ERROR');
        insert logConfSetting;
        
        Test.startTest();
        logger.error('testErrorMethod', 'testErrorMethod');
        logger.error('testErrorMethod2', '{0}', new Object[]{'testErrorMethod2'});
        logger.error('testErrorMethod3', 'testErrorMethod3', new MX_Exception());
        logger.error('testErrorMethod4', '{0}', new Object[]{'testErrorMethod4'}, new MX_Exception());
        Test.stopTest();
        
        MX_CommonLog__c log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod' Limit 1];
        System.assertEquals('testErrorMethod', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod2' Limit 1];
        System.assertEquals('testErrorMethod2', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod3' Limit 1];
        System.assertEquals('testErrorMethod3', log.MX_ComponentName__c); 
        log = [Select MX_ComponentName__c from MX_CommonLog__c where MX_ComponentName__c='testErrorMethod4' Limit 1];
        System.assertEquals('testErrorMethod4', log.MX_ComponentName__c); 
    }
}