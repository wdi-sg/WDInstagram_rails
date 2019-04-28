module ApplicationHelper
    def sortable (column, title = nil)
        title ||= column.titleize
        #adding a css class to create small arrows for sorting table
        css_class = column == sort_column ? "current  #{sort_direction}" :nil
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, :sort => column, :direction => direction
    end
end
