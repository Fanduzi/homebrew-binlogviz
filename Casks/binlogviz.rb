cask "binlogviz" do
  version "0.36.0"

  on_macos do
    on_intel do
      sha256 "0f278e5a2cdf82f2cbc59a2965d2de55e2eee6653c41d1edcd5d23e9711f1d8c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.36.0/binlogviz_0.36.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "3263343a31d4d247e29dc06b5bd1e5a9c44f8a297e8831bc69624226b9fcf1ce"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.36.0/binlogviz_0.36.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "8744a7190f6827338cf7389950985d4ad2f512d85bf406c6543feb5869b955ce"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.36.0/binlogviz_0.36.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "17e3c8ee6a5e9f713a77ab36d935b433ec86ab2ce64e194798d5c5a9c70006e0"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.36.0/binlogviz_0.36.0_linux_arm64.tar.gz",
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
