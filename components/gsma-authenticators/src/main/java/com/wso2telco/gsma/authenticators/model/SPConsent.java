package com.wso2telco.gsma.authenticators.model;

/**
 * Created by aushani on 7/26/17.
 */
public class SPConsent {

    private String consumerKey;

    private int operatorID;

    private int scopeId;

    private int expPeriod;

    private String consentType;

    private String validityType;

    private int consentId;


    public String getConsumerKey() {
        return consumerKey;
    }

    public void setConsumerKey(String consumerKey) {
        this.consumerKey = consumerKey;
    }

    public int getOperatorID() {
        return operatorID;
    }

    public void setOperatorID(int operatorID) {
        this.operatorID = operatorID;
    }

    public int getScope() {
        return scopeId;
    }

    public void setScope(int scope) {
        this.scopeId = scope;
    }

    public int getExpPeriod() {
        return expPeriod;
    }

    public void setExpPeriod(int expPeriod) {
        this.expPeriod = expPeriod;
    }

    public String getConsentType() {
        return consentType;
    }

    public void setConsentType(String consentType) {
        this.consentType = consentType;
    }

    public String getValidityType() {
        return validityType;
    }

    public void setValidityType(String validityType) {
        this.validityType = validityType;
    }

    public int getConsentId() {
        return consentId;
    }

    public void setConsentId(int consentId) {
        this.consentId = consentId;
    }
}
