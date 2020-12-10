# Application Helper
module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    return unless session[:source]

    content_tag(:p, "Thanks for visiting me from #{session[:source]}")
  end

  def nav_helper(tag = 'span', style = '')
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag}>
                      <a href=\"#{item[:path]}\" 
                         class=\"#{style} #{active?(item[:path])}\">
                          #{item[:title]}
                      </a>
                    </#{tag}>"
    end
    nav_links.html_safe
  end

  private

  def nav_items
    [
      { path: root_path, title: 'Home' },
      { path: about_path, title: 'About' },
      { path: contact_path, title: 'Contact' },
      { path: blogs_path, title: 'Blog' },
      { path: portfolios_path, title: 'Portfolios' }
    ]
  end

  def active?(path)
    'active' if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    alert_generator(alert) if alert
  end

  def alert_generator(msg)
    js add_gritter(msg, sticky: false)
  end
end
