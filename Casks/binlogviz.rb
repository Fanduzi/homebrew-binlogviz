cask "binlogviz" do
  version "0.12.0"

  on_macos do
    on_intel do
      sha256 "e47fb7f7feff247ed61c7ca6661ba13f206efa335ad39782eafd89815de1b012"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.12.0/binlogviz_0.12.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "4d1645a5c24cb140c252d536ba482507c1c16da99b0628f1c4fd848fb60c88e2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.12.0/binlogviz_0.12.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "ed7874176fee4579cc6774022674c14c39babbc7dfc23a3a3349ebf5eccf8f33"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.12.0/binlogviz_0.12.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "dab6e693187b531966863d097ec2dbdeaf6162dae656b6fbe26c08e9623413c5"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.12.0/binlogviz_0.12.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
