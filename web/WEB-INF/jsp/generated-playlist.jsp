<%@include file="menu.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!----------------------- index ------------------------>
<main>
    <div class="container">
        <h5 class="my-titre ${color}-text text-darken-3">
            <b>${titre}</b>
        </h5>
        <br>
        <br>
        <div class="tableau-box">
            <table class="striped">
                <tr>
                    <th>Lecture</th>
                    <th>Nom</th>
                    <th>Artiste</th>
                    <th>Genre</th>
                </tr>
                <s:forEach var="vazo" items="${playlist}">
                    <tr>
                        <td>
                            <audio controls class="play"><source src=${vazo.getChemin()} type="audio/mpeg"></audio>
                        </td>
                        <td>${vazo.getNom()}</td>
                        <td>${vazo.getArtiste()}</td>
                        <td>${vazo.getGenre()}</td>
                    </tr>
                </s:forEach>
            </table>
        </div>
    </div>
</main>

</body>
</html>
<script type="text/javascript" src="assets/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="assets/hammer.min.js"></script>
<script type="text/javascript" src="assets/materialize.min.js"></script>




