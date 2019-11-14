{% for l in langs %}
    <tr>
        <td>{{ l.id }}</td>
        <td>{{ l.lang_var }}</td>
        {% for key,lang in json_decode(constants.LANGS, true) %}
            <td><textarea class="form-control lang-textarea" data-id="{{ l.id }}" data-lang="{{ key }}" data-content="Language saved" data-placement="top">{{ l["lang_"~ key] }}</textarea></td>
        {% endfor %}
    </tr>
{% endfor %}