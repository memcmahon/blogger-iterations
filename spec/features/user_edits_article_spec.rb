require "rails_helper"

describe "user edits an article" do
  describe "they link from the article show" do
    describe "they fill in a title and body" do
      it "creates a new article" do
        article = Article.create!(title: "Test Article", body: "Test Article Body")

        visit article_path(article)

        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article))

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]",  with: "New Body!"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content("Article 'New Title!' Updated!")
        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end
    end
  end
end
