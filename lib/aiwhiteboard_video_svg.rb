# frozen_string_literal: true
require "cgi"
module AIWhiteboardVideoSvg
  def self.render(text, width: 800, height: 450, ink: "#1d4ed8", background: "#ffffff", duration: 1.5)
    raise ArgumentError, "text required" if text.to_s.strip.empty? || text.to_s.length > 120
    raise ArgumentError, "invalid options" unless width.is_a?(Integer) && width >= 300 && height.is_a?(Integer) && height >= 150 && duration.is_a?(Numeric) && duration.finite? && duration.positive?
    raise ArgumentError, "invalid color" unless [ink, background].all? { |x| x.match?(/\A#[0-9a-fA-F]{6}\z/) }
    x1=(width*0.18).round; x2=(width*0.82).round; y=(height*0.62).round; length=x2-x1
    safe=CGI.escapeHTML(text.to_s)
    %(<svg xmlns="http://www.w3.org/2000/svg" width="#{width}" height="#{height}" viewBox="0 0 #{width} #{height}" role="img" aria-label="#{safe}"><rect width="100%" height="100%" fill="#{background}"/><text x="50%" y="50%" text-anchor="middle" dominant-baseline="middle" font-family="Arial,sans-serif" font-size="52" fill="#{ink}" opacity="0">#{safe}<animate attributeName="opacity" from="0" to="1" dur="#{duration}s" fill="freeze"/></text><path d="M #{x1} #{y} L #{x2} #{y}" fill="none" stroke="#{ink}" stroke-width="6" stroke-dasharray="#{length}" stroke-dashoffset="#{length}"><animate attributeName="stroke-dashoffset" from="#{length}" to="0" dur="#{duration}s" fill="freeze"/></path></svg>)
  end
end
