<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="sidebar" class="col-md-3">

    <%-- Posts list --%>
    <div class="sidebar-posts">
        <ul class="sidebar-posts-list">
            <c:forEach var="post" items="${postList}">
                <li class="sidebar-posts-item">
                    <s:url var="postUrl" value="/post/${post.id}"/>
                    <a href="${postUrl}">
                            ${post.title}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <%-- End of Posts list --%>

    <%-- Tag cloud --%>
    <div class="sidebar-tag-cloud">
        <div id="tags-cloud-container">
            <canvas id="tags-cloud">
                <p>Anything in here will be replaced on browsers that support the canvas element</p>
            </canvas>
        </div>
        <div id="tags">
            <ul>
                <c:forEach var="tag" items="${tagList}">
                    <s:url var="tagUrl" value="/posts/tag/${tag.name}"/>
                    <li><a href="${tagUrl}">${tag.name}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <%-- End of Tag cloud --%>

    <%-- Archive --%>
    <div class="sidebar-archive">
        <div id="archive-tree">
            <ul>
                <li data-jstree='{"selected":true}'>Root
                    <ul>
                        <li>Child</li>
                        <li>Child</li>
                        <li>Child</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <%-- End of Archive --%>

    <s:url var="tagCanvasUrl" value="/resources/js/tagcanvas.min.js"/>
    <script src="${tagCanvasUrl}" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            try {
                TagCanvas.Start('tags-cloud', 'tags', {
                    textColour: '#111111',
                    outlineColour: '#ff00ff',
                    reverse: true,
                    depth: 0.8,
                    maxSpeed: 0.125
                });
            } catch (e) {
                document.getElementById('tags-cloud-container').style.display = 'none';
            }
        };
    </script>

    <s:url var="jsTreeCss" value="/resources/css/jstree.min.css"/>
    <link href="${jsTreeCss}" rel="stylesheet" type="text/css">

    <s:url var="jsTree" value="/resources/js/jstree.min.js"/>
    <script src="${jsTree}" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('#archive-tree').jstree({
                "core": {
                    "multiple": true
                }
            });
        });
    </script>

</div>