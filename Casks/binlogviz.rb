cask "binlogviz" do
  version "0.6.0"

  on_macos do
    on_intel do
      sha256 "26d309808b82b656ac5ad35a6dd009c4527d9320b643ef22f0b8e1bd308b8b02"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.6.0/binlogviz_0.6.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "ef87a1ec8ab3356b4baded74aa4f33405f048a3ca964464a34798e74c376cd6c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.6.0/binlogviz_0.6.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "d6630ebc3132a7dc0d867f2ce38e1600850ad101a8069d56325852c3c8a185de"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.6.0/binlogviz_0.6.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "5d0faa7f4177c529566637f6f18940c47e203f1b35a657b13f221e45c12253bf"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.6.0/binlogviz_0.6.0_linux_arm64.tar.gz",
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
