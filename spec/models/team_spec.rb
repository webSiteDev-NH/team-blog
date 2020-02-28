require 'rails_helper'

describe Team do
  describe '#create' do

    it "全てのバリデーションをクリアしないと登録出来ない" do
      team = build(:team)
      expect(team).to be_valid
    end

    it "team_nameが空では登録出来ない" do
      team = build(:team, team_name: nil)
      team.valid?
      expect(team.errors[:team_name]).to include(I18n.t('errors.messages.blank'))
    end

    it "representativeが空では登録出来ない" do
      team = build(:team, representative: nil)
      team.valid?
      expect(team.errors[:representative]).to include(I18n.t('errors.messages.blank'))
    end

    it "emailが空では登録出来ない" do
      team = build(:team, email: nil)
      team.valid?
      expect(team.errors[:email]).to include(I18n.t('errors.messages.blank'))
    end

    it "重複したemailが存在する場合登録出来ない" do
      team = create(:team)
      another_team = build(:team, email: team.email)
      another_team.valid?
      expect(another_team.errors[:email]).to include(I18n.t"errors.messages.taken")
    end

    it "passwordが空では登録出来ない" do
      team = build(:team, password: nil)
      team.valid?
      expect(team.errors[:password]).to include(I18n.t('errors.messages.blank'))
    end

    it "passwordが存在してもpassword_confirmationが空では登録出来ない" do
      team = build(:team, password_confirmation: "")
      team.valid?
      expect(team.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    
    it "passwordが６文字以上であれば登録出来る" do
      team = build(:team, password: "000000", password_confirmation: "000000")
      team.valid?
      expect(team).to be_valid
    end

    it "passwordが５文字以下であれば登録出来ない" do
      team = build(:team, password: "00000", password_confirmation: "00000")
      team.valid?
      expect(team.errors[:password]).to include(I18n.t("errors.messages.too_short", count: 6))
    end

  end
end