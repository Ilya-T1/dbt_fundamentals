<<<<<<< HEAD
{% macro cents_to_dollars(column_name, decimal_places=2) -%}
    round( 1.0 * {{ column_name }} / 100, {{ decimal_places }})
{%- endmacro %}
=======
{% macro cents_to_dollars(column_name, decimal_places=2) %}
    ({{ column_name }} / 100)::numeric(16, {{ decimal_places }})
{% endmacro %}
>>>>>>> 5e53dc3f5556d83e5a3e32ed4d9c6c68254af917
