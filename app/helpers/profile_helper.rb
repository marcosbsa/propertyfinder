module ProfileHelper

def coverimg_url account
    account.coverimg.present? ? account.coverimg.url : "/img"
end

end