{#
  Parameters:
    * currentPage (int) : the current page you are in
    * perPage (int) : Content per page
    * paginationPath (string) : the route name to use for links
    * showAlwaysFirstAndLast (bool) : Always show first and last link (just disabled)
    * contentCount (int) : Content count
    * ulClass (string) : Pagination ul costum class
#}

{# Content per page #}
{% if perPage == false %}
    {% set perPage = 10 %}
{% endif %}
{# the number of first and last pages to be displayed #}
{% set extremePagesLimit = 3 %}

{# the number of pages that are displayed around the active page #}
{% set nearbyPagesLimit = 3 %}

{# Last page #}
{% set lastPage =  (contentCount/perPage) | round (0, 'ceil') %}

{% if lastPage > 1 %}
    <ul class="pagination {{ ulClass }}">
        {% if currentPage > 1 %}
            {# First page #}
            {% if showAlwaysFirstAndLast %}
                <li><a href="{{ paginationPath }}{{ 1 }}">Start</a></li>
            {% endif %}

            <li><a href="{{ paginationPath }}{{ currentPage-1 }}">«</a></li>

            {% for i in range(currentPage-nearbyPagesLimit, currentPage-1) if ( i > 0 ) %}
                <li><a href="{{ paginationPath }}{{ i }}">{{ i }}</a></li>
            {% endfor %}
        {% endif %}
        {# Current page #}
        <li class="active"><a>{{ currentPage }}</a></li>

        {% if currentPage < lastPage %}
            {% for i in range(currentPage+1, currentPage + nearbyPagesLimit) if ( i <= lastPage ) %}
                <li><a href="{{ paginationPath }}{{ i }}">{{ i }}</a></li>
            {% endfor %}

            <li><a href="{{ paginationPath }}{{ currentPage+1 }}">»</a></li>

            {# Last page #}
            {% if showAlwaysFirstAndLast %}
                <li><a href="{{ paginationPath }}{{ lastPage }}">End</a></li>
            {% endif %}
        {% endif %}
    </ul>
{% endif %}