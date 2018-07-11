<%@taglib uri="http://www.springframework.org/tags" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s" %>
<!doctype html>
<html>
<head>
    <base href="/">
    <title>Projet Prolog</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/materialize.min.css" type="text/css"/>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
    <meta name="viewport" content="width=device-width">
</head>
<body>
<!----------------------- Menu Principal  ------------------------>
<header>
    <div class="navbar">
        <nav class="nav-extended ${color} darken-3">
            <div class="nav-wrapper">
                <a class="brand-logo center white-text" href="/">
                    <strong>${title}</strong>
                </a>
            </div>
        </nav>
    </div>
</header>

