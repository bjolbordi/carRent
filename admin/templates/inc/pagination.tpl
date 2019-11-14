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
                <li class="page-item pagination-start"><a href="{{ paginationPath }}{{ 1 }}" class="page-link">Start</a></li>
            {% endif %}

            <li class="page-item pagination-prev"><a href="{{ paginationPath }}{{ currentPage-1 }}" class="page-link">Prev</a></li>

            {% for i in range(currentPage-nearbyPagesLimit, currentPage-1) if ( i > 0 ) %}
                <li class="page-item"><a href="{{ paginationPath }}{{ i }}" class="page-link">{{ i }}</a></li>
            {% endfor %}
        {% endif %}
        {# Current page #}
        <li class="page-item active"><span class="page-link">{{ currentPage }}</span></li>

        {% if currentPage < lastPage %}
            {% for i in range(currentPage+1, currentPage + nearbyPagesLimit) if ( i <= lastPage ) %}
                <li class="page-item"><a href="{{ paginationPath }}{{ i }}" class="page-link">{{ i }}</a></li>
            {% endfor %}

            <li class="page-item pagination-next"><a href="{{ paginationPath }}{{ currentPage+1 }}" class="page-link">Next</a></li>

            {# Last page #}
            {% if showAlwaysFirstAndLast %}
                <li class="page-item pagination-end"><a href="{{ paginationPath }}{{ lastPage }}" class="page-link">End</a></li>
            {% endif %}
        {% endif %}
    </ul>
{% endif %}