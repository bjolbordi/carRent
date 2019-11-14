{% if view == 'portfolio' or view == 'photogallery' or view == 'videogallery' or view == 'product'%}
    <option value="0">All</option>
{% else %}
    <option value="0">None</option>
{% endif %}
{% for opt in options %}
    <option value="{{ opt.id }}" {{ opt.id == id ? 'selected' }}>{{ opt.title }}</option>
{% endfor %}