# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
require 'redcarpet'
require 'pygments'

class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language)
  end
end