require 'spec_helper'
require './lib/renderers/html_smarty_with_syntax_renderer'

describe HTMLSmartyWithSyntaxRenderer do
  describe '.block_code' do
    before do
      @output = HTMLSmartyWithSyntaxRenderer.new.block_code('cd', 'bash')
      @expected = %Q{<div class="highlight"><pre><span class="nb">cd</span>\n</pre></div>}
    end

    it 'adds syntax highlighting HTML to code blocks with a language class' do
      @output.should eq(@expected)
    end
  end

  describe 'when rendering' do
    before do
      renderer = Redcarpet::Markdown.new(HTMLSmartyWithSyntaxRenderer)
      @output = renderer.render(%Q{"I'm copy." ```"I'm code!"```})

      @expected = %Q{<p>&ldquo;I&rsquo;m copy.&rdquo; <code>&quot;I&#39;m code!&quot;</code></p>\n}
    end

    it 'applies smartquotes except in code blocks' do
      @output.should eq(@expected)
    end
  end
end
