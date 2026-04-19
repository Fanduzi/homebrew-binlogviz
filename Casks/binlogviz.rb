cask "binlogviz" do
  version "0.18.1"

  on_macos do
    on_intel do
      sha256 "628db0015f4bec0ad7628fd798bf43016f7c0509ac99c65c928fb577c1a2efc5"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.1/binlogviz_0.18.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "9b7ea930a38d1948120e7f75e7617f358be005f7639b1c4f4fadb429c71a56b4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.1/binlogviz_0.18.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "3699616420ba008d6d0ee1348918b8f270e8b484792b064a9a8a8b5906d82f40"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.1/binlogviz_0.18.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "fc25644ab5a360323578caa251378c9f7003a86a91e97f496efb5bd21a49d86c"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.1/binlogviz_0.18.1_linux_arm64.tar.gz",
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
