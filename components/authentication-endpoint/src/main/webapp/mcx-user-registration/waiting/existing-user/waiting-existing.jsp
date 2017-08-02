<%@ page import="com.wso2telco.identity.application.authentication.endpoint.util.ReadMobileConnectConfig" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="javax.xml.xpath.XPathExpressionException" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" name="sessionDataKey" id="sessionDataKey" value='<%=sessionDataKey%>'/>
<div class="site__root" id="content-placeholder"></div>
<fmt:message key="waiting-label-continue-on-device-otp-prompt" var="prompt" />

<!-- The handlebar template -->
<script id="results-template" type="text/x-handlebars-template">
	<main class="site__main site__wrap section v-distribute">
		<header class="page__header">
			<h1 class="page__heading"><fmt:message key='waiting-label-continue-on-device-heading'/></h1>
			<p>

				<%
					String authenticators = request.getParameter("authenticators");
					Boolean showSMSLink = false;
					Boolean smsotp =false;
					if(authenticators != null && authenticators.contains("SMSOTPAuthenticator")) {
						smsotp=true;
				%>
				<fmt:message key='waiting-label-continue-on-device-intro-otp-sms'/>
				<%} else if(authenticators != null && authenticators.contains("SMSAuthenticator")) { %>
				<fmt:message key='waiting-label-continue-on-device-intro-sms'/>
				<%} else if (authenticators != null && authenticators.contains("USSDAuthenticator")) {
					showSMSLink = true; %>
				{{continue-on-device-intro-ussd}}
				<%} else if (authenticators != null && authenticators.contains("USSDPinAuthenticator")){
					showSMSLink = true; %>
				{{continue-on-device-intro-ussd-pin}}
				<%} else {%>
				{{continue-on-device-intro-default}}
				<%}%>

                <%
                    String acr = request.getParameter("acr_values");
                    if (acr.equals("3")) {
                        showSMSLink = false;
                    }
                %>

            </p>
		</header>

		<div class="page__illustration v-grow v-align-content">
			<div>

				<div class="timer-spinner-wrap">
					<div class="timer-spinner">
						<div class="pie spinner"></div>
						<div class="pie filler"></div>
						<div class="mask"></div>
					</div>
					<img src="images/svg/phone-pin.svg" width="52" height="85">
				</div>
			</div>
		</div>
		<div class="error-copy space--bottom hide" id="timeout-warning">
			{{continue-on-device-timeout}}
		</div>
		<% if (showSMSLink) { %>
		<%  ReadMobileConnectConfig readMobileConnectConfig = new ReadMobileConnectConfig();
			String fallbackPrefix = readMobileConnectConfig.query("SMS").get("FallbackPrefix");
		%>
		<p class="page__copy flush">{{ussd-sent-resend-sms-prompt}}
			<br>
			<a onclick="sendSMS('<%=sessionDataKey%>');" style="cursor:pointer"><u>
				{{ussd-sent-resend-sms-button}}
			</u></a>
		</p>
		<br>
		<br>
		<%  }
			if (smsotp) { %>
				<div id="otperror" class="parsley-errors-list filled" style="text-align: center;display: none">
				</div>
				<div>
					<ul class="form-fields">
						<li>
<<<<<<< a0346b28625d834112ae557d86dbbd9550ee9a82
							<input  id="smsotp" type="number" name="smsotp"  onselectstart="return false" onpaste="return false;" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false" autocomplete=off placeholder='<%=pageContext.getAttribute("prompt") %>' />
=======
							<input  id="smsotp" type="text" onkeyup="this.value=this.value.replace(/[^\d]/,'')"  onselectstart="return false" onpaste="return false;" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false" autocomplete=off placeholder="{{continue-on-device-otp-prompt}}"
									  onkeypress="return event.keyCode != 13;"/>
>>>>>>> [IDSDEV-668], [IDSDEV-662], [IDSDEV-664] Fixed
						</li>
						<li>
							<button id="smsotpsubmit" type="button" onclick="sendSMSOTP('<%=sessionDataKey%>');"  class="btn btn--outline btn--large btn--full" >
								<fmt:message key='common-button-misc-submit'/>
							</button>
						</li>
					</ul>
				</div>
		<%	} %>
		<a onclick="handleTermination(true);" class="btn btn--outline btn--full btn--large">
			<fmt:message key='common-button-misc-cancel'/>
		</a>
	</main>
</script>
<script src="js/sha256.js"></script>
<script src="mcx-user-registration/js/waiting/existing-user/waiting.js"></script>
