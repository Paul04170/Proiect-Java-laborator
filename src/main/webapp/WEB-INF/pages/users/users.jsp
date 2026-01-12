<!-- html -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <form method="POST" action="${pageContext.request.contextPath}/Users">
        <h1>Users</h1>
        <div class="mb-3">
            <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/AddUser">Add User</a>
            </c:if>
            <button type="submit" name="invoice" class="btn btn-secondary">Invoice</button>
        </div>

        <div class="container text-center">
            <div class="row fw-bold">
                <div class="col-auto">Select</div>
                <div class="col">Email</div>
                <div class="col">Name</div>
            </div>
            <jsp:useBean id="users" scope="request" type="java.util.List"/>
            <c:forEach var="user" items="${users}">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <input type="checkbox" name="user_ids" value="${user.id}" />
                    </div>
                    <div class="col">${user.email}</div>
                    <div class="col">${user.name}</div>
                </div>
            </c:forEach>
        </div>
    </form>
    <c:if test="${not empty invoices}">
        <h2>Invoices</h2>
        <c:forEach var="username" items="${invoices}" varStatus="status">
            ${status.index + 1}. ${username}
            <br/>
        </c:forEach>
    </c:if>
</t:pageTemplate>