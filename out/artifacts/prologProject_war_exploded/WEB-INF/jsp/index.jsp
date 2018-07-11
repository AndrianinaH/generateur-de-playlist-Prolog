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
        <div class="login-box">
            <form method="POST" action="generate-playlist">
                <p>Entrer la durée total de la playlist (en seconde) :</p>
                <div class='input-field col s12'>
                    <input type='number' id='total' name="total" value="${total}" required>
                    <label for='total'>Durée total</label>
                </div>
                <p>Entrer la durée minimal par chanson (en seconde) :</p>
                <div class='input-field col s12'>
                    <input type='number' id='min' name="min" required>
                    <label for='min'>Durée minimal</label>
                </div>
                <p>Entrer la durée maximal par chanson (en seconde) :</p>
                <div class='input-field col s12'>
                    <input type='number' id='max' name="max" required>
                    <label for='max'>Durée maximal</label>
                </div>
                <p>Choisissez les genres de la playlist :</p>
                <div class="input-field col s12">
                    <select multiple name="allGenre" required>
                        <s:forEach var="genre" items="${allGenre}">
                            <option value="${genre.getGenre()}" selected>${genre.getGenre()}</option>
                        </s:forEach>
                    </select>
                </div>
                <div class="my-divider"></div>
                <br>
                <div class="centreo">
                    <div class='row'>
                        <button type='submit' class='col s12 btn btn-large waves-effect ${color} darken-3'>Générer la playlist</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>

</body>
</html>
<script type="text/javascript" src="assets/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="assets/hammer.min.js"></script>
<script type="text/javascript" src="assets/materialize.min.js"></script>

<script>
    $(document).ready(function() {
        $('select').material_select();
    });
</script>
