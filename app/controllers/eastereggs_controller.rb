class EastereggsController < ApplicationController
  skip_before_action :authenticate_user!, only: :curriculum
end
