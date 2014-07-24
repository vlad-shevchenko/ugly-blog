<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<div>
    <s:url value="/post" var="postUrl"/>
    <form:form commandName="post" action="${postUrl}" method="put">
        Title:<br/>
        <form:input path="title"/><br/>
        Text:<br/>
        <form:textarea path="text"/><br/>
        Tags:<br/>
        <input type="text" name="tagsString"/><br/>
        <form:button>
            Save
        </form:button>
    </form:form>
</div>