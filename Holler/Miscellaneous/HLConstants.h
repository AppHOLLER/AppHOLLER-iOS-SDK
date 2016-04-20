//
//  HollerConstants.h
//  Holler_iOS_SDK
//
//  Created by Phong Nguyen on 4/14/16.
//  Copyright © 2016 RML. All rights reserved.
//

#ifndef HollerConstants_h
#define HollerConstants_h

//System Abbr
#define HollerUserDefaults                                          [NSUserDefaults standardUserDefaults]

//Credentials
#define HLDeviceToken                                               @"HLDeviceToken"

//Detach
#define HLApplicationId                                             @"HollerApplicationId"
#define HLAccessId                                                  @"HollerAccessId"
#define HOLLERAppId                                                 @"HLAppId"
#define HOLLERAccessId                                              @"HLAccessId"

//HTTP REQUEST
#define HOLLER_DEBUG                                                @"http://dev.holler.rainmaker-labs.com/api"
#define HOLLER_STAGING                                              @"http://staging.holler.rainmaker-labs.com/"
#define HOLLER_LIVED                                                @"http://beta.appholler.com/api"

//RESTful API
#define HOLLER_SERVICE_GET_ALL_SUBSCRIBER                           @"/subscribers/"
#define HOLLER_SERVICE_GET_TOTAL_SUBSCRIBER                         @"/subscribers/total/"
#define HOLLER_SERVICE_REGISTER_SUBSCRIBER                          @"/subscribers/register/"
#define HOLLER_SERVICE_UPDATE_SUBSCRIBER                            @"/subscribers/%@"

//Gender
#define HOLLER_SERVICE_GET_LIST_GENDER                              @"/target/?content_type=gender"
//Designation
#define HOLLER_SERVICE_GET_LIST_DESIGNATION                         @"/target/?content_type=designation"
//Interest
#define HOLLER_SERVICE_GET_LIST_INTEREST                            @"/target/?content_type=interest"
//Industry
#define HOLLER_SERVICE_GET_LIST_INDUSTRY                            @"/target/?content_type=industry"
//Location
#define HOLLER_SERVICE_GET_LIST_LOCATION                            @"/target/?content_type=location"
//Country
#define HOLLER_SERVICE_GET_LIST_COUNTRY                             @"/target/?content_type=country"
//Device
#define HOLLER_SERVICE_GET_LIST_DEVICE                              @"/target/?content_type=device"

//Application
#define HOLLER_SERVICE_GET_APPLICATION                              @"/apps/%@"

//Push Notification
#define HOLLER_SERVICE_RECEIVE_PUSH_NOTIFICATION                    @"/api/pushnotif/update-reached-subscriber/"

//End RESTful API

//K-V Detach
#define COMMON_KEY_ID                                               @"id"

//Error
#define ERROR_DETAIL                                                @"detail"
#define ERROR_BOOLEAN                                               @"error"
#define ERROR_STATUS_CODE                                           @"status_code"

//Subscriber
#define SUBSCRIBER_USERNAME                                         @"username"
#define SUBSCRIBER_EMAIL_ADDRESS                                    @"email"
#define SUBSCRIBER_FIRSTNAME                                        @"first_name"
#define SUBSCRIBER_LASTNAME                                         @"last_name"
#define SUBSCRIBER_IS_ACTIVE                                        @"is_active"
#define SUBSCRIBER_CREATED_DATE                                     @"created_at"
#define SUBSCRIBER_UPDATED_DATE                                     @"updated_at"
#define SUBSCRIBER_CELLPHONE_NUMBER                                 @"phone"
#define SUBSCRIBER_INFORMATION                                      @"info"
#define SUBSCRIBER_TOTAL                                            @"total"

//Subscriber_Devicetoken
#define SUBSCRIBER_DEVICE_TOKEN                                     @"device_token"
#define SUBSCRIBER_DEVICE_TYPE                                      @"device_type"

//Push Notification Detacher
#define HL_PUSH_APS                                                 @"aps"
#define HL_PUSH_ALERT                                               @"alert"
#define HL_PUSH_CUSTOM                                              @"custom"
#define HL_PUSH_DATA_A                                              @"a"
#define HL_PUSH_COMMUNICATION_ID                                    @"communication_id"


//Application
#define HOLLER_APP_NAME                                             @"name"
#define HOLLER_APP_ID                                               @"application_id"
#define HOLLER_APP_ACESS_ID                                         @"access_key_id"
#define HOLLER_APP_DESCRIPTION                                      @"description"
#define HOLLER_APP_APNS_P12                                         @"apns_p12"
#define HOLLER_APP_APNS_FILE_NAME                                   @"file_name"
#define HOLLER_APP_ENV                                              @"apns_env"
#define HOLLER_APP_GCM_CREDENTIAL                                   @"gcm_apikey"
#define HOLLER_APP_CREATED_DATE                                     @"created_at"
#define HOLLER_APP_UPDATED_DATE                                     @"updated_at"
#define HOLLER_APP_TIMEZONE                                         @"timezone"
#define HOLLER_APP_DEMOABLE                                         @"is_demo"

//Target
#define TARGET_APPLICATION_ID                                       @"application_id"
#define TARGET_IS_PUBLISHED                                         @"is_published"

#define TARGET_NAME                                                 @"name"
#define TARGET_KEY                                                  @"key"

#define TARGET_IS_DEVICE                                            @"device"
#define TARGET_IS_COUNTRY                                           @"country"
#define TARGET_IS_LOCATION                                          @"location"
#define TARGET_IS_DESIGNATION                                       @"designation"
#define TARGET_IS_INTEREST                                          @"interest"
#define TARGET_IS_INDUSTRY                                          @"industry"
#define TARGET_IS_GENDER                                            @"gender"

#define TARGET_INDUSTRY_NAME                                        @"industry_name"
#define TARGET_INTEREST_NAME                                        @"interest_name"
#define TARGET_DESIGNATION_NAME                                     @"designation_name"

#define TARGET_LOCATION_NAME                                        @"location_name"
#define TARGET_LOCATION_LATITUDE                                    @"gps_latitude"
#define TARGET_LOCATION_LONGITUDE                                   @"gps_longitude"
#define TARGET_LOCATION_RADIUS                                      @"radius"

//End K-V Detacher

#endif