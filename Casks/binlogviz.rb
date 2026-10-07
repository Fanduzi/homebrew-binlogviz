cask "binlogviz" do
  version "0.23.18"

  on_macos do
    on_intel do
      sha256 "c0ea1770c67847402edf6146ce80e17e76ef4a8d96405d3f0fe880e30d776bf5"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.18/binlogviz_0.23.18_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "6cfefb1412f408e8dae0ec81a391fe4bf340d6c02ceac677f6f34621b413131a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.18/binlogviz_0.23.18_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "3239ab988c29b3d222edc674f6352501a3fbf0f3251ea4ce433aa35777bf1bd3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.18/binlogviz_0.23.18_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "140171b0c28f36a42ab0d5792b1380c90f2f805a39db95c0a3ade38704bba8ea"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.18/binlogviz_0.23.18_linux_arm64.tar.gz",
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
