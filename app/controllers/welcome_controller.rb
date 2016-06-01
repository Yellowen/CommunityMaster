class WelcomeController < ApplicationController
  def index
  end

  def not_found
    p = params[:failed_path].colorize(:blue)
    f = params[:format].colorize(:blue)

    msg = "  [WARN] ROUTES: No route match for '".colorize(:yellow) +
      p + "' format: '".colorize(:yellow) + f + "'.".colorize(:yellow)

    logger.warn msg
    head 204
  end

  private

  def index_liquid_tags
    ['Faalis::Page::Components::Menu']
  end
end
